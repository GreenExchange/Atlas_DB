USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_WorkAreaPaymentSummaryInforamtion]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[LCJ_WorkAreaPaymentSummaryInforamtion] --[LCJ_WorkAreaPaymentSummaryInforamtion]'Fh07-42372'

(
@Case_Id as NVARCHAR(400)
)

AS

Select max(CASE_ID) as [case_id],min(convert(varchar(10),DATEOFSERVICE_START,101)) as [DATEOFSERVICE_START],
max(convert(varchar(10),DATEOFSERVICE_END,101)) as [DATEOFSERVICE_END],sum(CLAIM_AMOUNT) as [Claim_Amount],
sum(PAID_AMOUNT) as [Paid_Amount],
max(DATE_BILLSENT) as [DATE_BILLSENT] from 
tblTreatment where Case_Id= + @Case_Id
GO
