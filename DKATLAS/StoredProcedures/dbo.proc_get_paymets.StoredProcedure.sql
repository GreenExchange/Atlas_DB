USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[proc_get_paymets]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE proc [dbo].[proc_get_paymets]---proc_get_paymets @TransactionsDate='01/01/2014'
@TransactionsDate nvarchar(50)
as
begin
declare @basepath nvarchar(max)
set @basepath=(select ParameterValue from tblApplicationSettings where ParameterName='DocumentUploadLocationPhysical')
 SELECT distinct
			trans.Transactions_Id, 
			cas.Case_Id AS Case_Id	,	
			dbo.fncGetBillNumber(cas.Case_ID) AS BILL_NUMBER,			
			case when isnull(trans.ChequeNo,'') ='' then convert(nvarchar(50),trans.Transactions_Id)+'-'+cas.Case_Id else isnull(trans.ChequeNo,'')end  [ChequeNo],
			case when trans.CheckDate is null  then CONVERT(VARCHAR(10), trans.Transactions_Date, 101)  else trans.CheckDate end[CheckDate],
			convert(decimal(38,2),trans.Transactions_Amount) AS Transactions_Amount,
			CONVERT(VARCHAR(10), trans.Transactions_Date, 101) AS Payment_date,
			trans.Transactions_Type,
		     cas.gb_case_id ,
			trans.BatchNo,
			trans.Transactions_Description [TransactionsDescription]
			
		FROM  dbo.tblCase cas
		     INNER JOIN tblTransactions trans on cas.case_id = trans.Case_Id
              where
			   convert(date,trans.Transactions_Date)>convert(date,@TransactionsDate) 
			  and 
			  Transactions_Type in('PreCToP',
										'PreC',
										'C',
										'I') and isnull(cas.gb_case_id,'')<>''
	


			SELECT @basepath+I.FILEPATH+I.FILENAME[PATH],it.DateInserted,t.CaseID,Filename[FileName],
			I.FILEPATH+I.FILENAME [Link],
			I.FILENAME [FileName], ''BasePathId 
			from dbo.TBLDOCIMAGES I 
inner Join dbo.tblImageTag IT on IT.ImageID=i.ImageID 
inner Join dbo.tblTags T on T.NodeID = IT.TagID 

WHERE NodeName = 'PAYMENTS - PROVIDER' 
 and convert(date,DateInserted)>=convert(date,@TransactionsDate)

end
GO
