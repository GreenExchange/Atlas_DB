USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[insff]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insff]  
(  
@cid varchar(50),  
@fees varchar(10)  
)  
as  
begin  
insert into tbltransactions (Case_Id,Transactions_Type,Transactions_Date,Transactions_Amount,Transactions_Description,Provider_Id,User_Id,Transactions_Fee,Transactions_status,Invoice_Id)  
select @cid,'FFB',getdate(),convert(money,@fees),'INDEX FEES',provider_id,'system',convert(money,@fees),null,0 FROM 
lcj_vw_Casesearchdetails WHERE CASE_ID=@CID and provider_ff = 1  
  
insert into tbltransactions (Case_Id,Transactions_Type,Transactions_Date,Transactions_Amount,Transactions_Description,Provider_Id,User_Id,Transactions_Fee,Transactions_status,Invoice_Id)  
select @cid,'FFBF',getdate(),convert(money,@fees),'INDEX FEES NOT BILLED TO PROVIDER',provider_id,'system',convert(money,@fees),null,0 FROM 
lcj_vw_Casesearchdetails WHERE CASE_ID=@CID and provider_ff = 0  
  
  
UPDATE TBLCASE SET DATE_SUMMONS_SENT_COURT = GETDATE(),status = 'SUMMONS-SENT-TO-COURT'  
WHERE CASE_ID=@CID  
  
INSERT INTO TBLNOTES  
SELECT 'SUMMONS SENT TO COURT AND BILLED','A',0,@CID,GETDATE(),'SYSTEM'  
  
  
end
GO
