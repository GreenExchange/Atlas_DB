USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_getPaymentTreatments]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LCJ_getPaymentTreatments] --[LCJ_getPaymentTreatments]178036
(    
   @Treatment_Id INT=NULL    
)    
AS    
BEGIN    
	 SELECT    
	   Treatment_Id,    
	   Case_Id,    
	   convert(nvarchar(20),DateOfService_Start,101) DateOfService_Start,    
	   convert(nvarchar(20),DateOfService_End,101) DateOfService_End,    
	   Claim_Amount,    
	   Paid_Amount,    
	   convert(nvarchar(20),Date_BillSent,101) Date_BillSent,   
	   SERVICE_TYPE,
	   Account_Number,
	   BILL_NUMBER,
	   Action_Type,
	   Fee_Schedule,
	   DenialReason_ID,
	   PeerReviewDoctor_ID,
	   TreatingDoctor_ID
	  	 FROM 
		tblTreatment    
	 WHERE 
		Treatment_Id=@Treatment_Id    
 

 
END
GO
