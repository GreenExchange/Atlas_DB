USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[reverseInvoice]    Script Date: 6/17/2019 2:54:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[reverseInvoice](  
@id int  
)  
as  
begin  
declare @deleted_id int

insert into tblclientaccount_deleted 
select * from tblclientaccount where account_id=@id

select @deleted_id=account_id from tblclientaccount_deleted where account_id=@id

if(@deleted_id=@id) 
	begin

insert into tblnotes  
SELECT top 1 'INVOICE NO ' + CONVERT(VARCHAR,@ID) + ' REVERSED','ACTIVITY','1',CASE_ID,GETDATE(),'FINANCIALS' FROM TBLTRANSACTIONS WHERE INVOICE_ID=@ID  and isnull(invoice_by,'')=''
  
update tbltransactions set Transactions_status = null,Invoice_id=null where Invoice_Id=@id and isnull(invoice_by,'')=''


UPDATE TblProvider
SET cost_balance =Prev_Cost_Balance 
from TblProvider P INNER JOIN tblclientaccount C on P.Provider_Id = C.Provider_Id WHERE ACCOUNT_ID=@ID

  
delete from TBLCLIENTACCOUNT WHERE ACCOUNT_ID=@ID
  
	end
end
GO
