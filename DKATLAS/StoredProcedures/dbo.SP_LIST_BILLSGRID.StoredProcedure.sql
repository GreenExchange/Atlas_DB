USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[SP_LIST_BILLSGRID]    Script Date: 6/17/2019 2:54:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_LIST_BILLSGRID]  --[SP_LIST_BILLSGRID] 'FL14-3663'
 @CASE_ID NVARCHAR(50)        
AS        
BEGIN      
		Select rank() OVER (Order by DateOfService_Start,DateOfService_End,Treatment_Id   asc ) as rank,        
		ISNULL(Treatment_Id,'N/A')[Treatment_Id],        
		ISNULL(Case_Id,'N/A')[Case_Id],
		'<TABLE  width="100%" border="0"><TR>'
			 + '<TD width="2px" bgcolor="'
			 + CASE  WHEN (isnull(Claim_Amount,0.00) - isnull(Paid_Amount,0.00)) <= 0.00
		   THEN 'RED'
		   ELSE 'YELLOW' END  
			 +'">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</TD>'
			 + '</TR></TABLE>' [Paid_NotPaid],
		ISNULL(convert(nvarchar(20),DateOfService_Start,101),'N/A')[DateOfService_Start],        
		ISNULL(convert(nvarchar(20),DateOfService_End,101),'N/A')[DateOfService_End],        
		ISNULL(convert(nvarchar(50),Claim_Amount),'0.00')[Claim_Amount],        
		ISNULL(convert(nvarchar(50),Paid_Amount),'0.00')[Paid_Amount],        
		ISNULL(convert(varchar(10),Date_BillSent,101),'')[Date_BillSent],        
		ISNULL(convert(varchar(max),SERVICE_TYPE),'')[SERVICE_TYPE],   
		CASE WHEN ISNULL(DenialReason_ID,0) = '0' THEN '' ELSE ISNULL(Reasons.DenialReasons_Type,'') END  as DENIALREASONS_TYPE,
		(SELECT COUNT(*) FROM TXN_TBLTREATMENT WHERE TREATMENT_ID = tblTreatment.TREATMENT_ID) AS DENIAL_COUNT,
		ISNULL(RDR.Doctor_Name,'') as DOCTOR_NAME ,
		(SELECT COUNT(*) FROM TXN_CASE_PEER_REVIEW_DOCTOR WHERE TREATMENT_ID=tblTreatment.TREATMENT_ID) AS [DCOUNT],
		 ISNULL(ODR.Doctor_Name,'') as Treating_Doctor,
		(SELECT COUNT(*) FROM txn_case_treating_doctor WHERE TREATMENT_ID=tblTreatment.Treatment_Id) As [TreatingDoc_COUNT],
		ISNULL(Account_Number,Isnull(Bill_Number,'')) AS Account_Number,
		ISNULL(Action_Type,'N/A') AS Action_Type,   
		ISNULL(Fee_Schedule,0.00)  AS Fee_Schedule,
		'' as Operating_Doctor,
		ISNULL(convert(nvarchar(50),Claim_Amount-Paid_Amount),'0.00') [Balance_Amount]
		from tblTreatment 
		LEFT OUTER JOIN tblDenialReasons Reasons on   Reasons.DenialReasons_Id=tblTreatment.DenialReason_ID 
		LEFT OUTER JOIN TblReviewingDoctor RDR ON RDR.Doctor_id=tblTreatment.PeerReviewDoctor_ID
		LEFT OUTER JOIN tblOperatingDoctor ODR ON ODR.Doctor_id=tblTreatment.TreatingDoctor_ID
		where Case_Id=@CASE_ID 
		Order by rank


END
GO
