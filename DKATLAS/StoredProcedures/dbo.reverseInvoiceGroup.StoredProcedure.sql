USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[reverseInvoiceGroup]    Script Date: 6/17/2019 2:54:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[reverseInvoiceGroup]   -- [reverseInvoiceGroup] 1
 (  
@id int  
)  
as  
begin  
declare @deleted_id int

insert into tblclientaccountGroup_deleted 
select * from tblclientaccountGroup where account_id=@id

select @deleted_id=account_id from tblclientaccountGroup_deleted where account_id=@id

if(@deleted_id=@id) 
	begin

insert into tblnotes  
SELECT top 1 'INVOICE NO ' + CONVERT(VARCHAR,@ID) + ' REVERSED','ACTIVITY','1',CASE_ID,GETDATE(),'FINANCIALS' FROM TBLTRANSACTIONS WHERE INVOICE_ID=@ID  and isnull(invoice_by,'')='Group'
  
update tbltransactions set Transactions_status = null,Invoice_id=null where Invoice_Id=@id and isnull(invoice_by,'')='Group'


UPDATE TblProvider
SET cost_balance =Prev_Cost_Balance 
from TblProvider P INNER JOIN tblclientaccountGroup C on P.Provider_GroupName = C.Provider_GroupName WHERE ACCOUNT_ID=@ID



delete from tblclientaccountGroup WHERE ACCOUNT_ID=@ID
  
	end
end
GO
