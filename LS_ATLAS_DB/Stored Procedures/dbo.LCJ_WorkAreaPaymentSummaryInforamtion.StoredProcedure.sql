USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_WorkAreaPaymentSummaryInforamtion]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LCJ_WorkAreaPaymentSummaryInforamtion] --[LCJ_WorkAreaPaymentSummaryInforamtion] 'amt','AMT18-102837'

(
@DomainId AS NVARCHAR(50),
@Case_Id as NVARCHAR(400)
)

AS

Select max(CASE_ID) as [case_id],min(convert(varchar(10),DATEOFSERVICE_START,101)) as [DATEOFSERVICE_START],
	  max(convert(varchar(10),DATEOFSERVICE_END,101)) as [DATEOFSERVICE_END],sum(CLAIM_AMOUNT) as [Claim_Amount],
	  sum (CONVERT(float, Claim_Amount) - CONVERT(float, Paid_Amount)) AS [Claim_Balance],
       sum(PAID_AMOUNT) as [Paid_Amount],
       sum(Fee_Schedule) as  [Fee_Schedule],
	   (select sum(transactions_amount) from tblTransactions (NOLOCK)  where tblTransactions.case_id=tblTreatment.Case_Id and DomainId=@DomainId and Transactions_Type in ('PreC','PreCToP'))[Voluntary_Payment],
	   (select sum(transactions_amount) from tblTransactions  (NOLOCK) where tblTransactions.case_id=tblTreatment.Case_Id and DomainId=@DomainId and Transactions_Type in ('C','I'))[Collection_Payment],
	  -- max(convert(decimal(38,2),Claim_Amount)-convert(decimal(38,2),Paid_Amount))[Claim_Balance],
	  -- max(ISNULL(CONVERT(DECIMAL(38,2),FEE_SCHEDULE),0)-ISNULL(CONVERT(DECIMAL(38,2),PAID_AMOUNT),0)) AS BALANCE_FS, 
	 --  max (ISNULL(CONVERT(float,FEE_SCHEDULE),0)-ISNULL(CONVERT(float,PAID_AMOUNT),0))[BALANCE_FS],
	 sum (CONVERT(float, FEE_SCHEDULE) - CONVERT(float, PAID_AMOUNT)) AS [BALANCE_FS],
       max(DATE_BILLSENT) as [DATE_BILLSENT] 
	   from tblTreatment (Nolock) where Case_Id= + @Case_Id and DomainId=@DomainId GROUP BY tblTreatment.Case_Id



GO
