USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_UpdatePaymentTreatments]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LCJ_UpdatePaymentTreatments]  --110980,'','01/01/2009','01/01/2009' 
(    
	@DomainId NVARCHAR(50),
   @Treatment_Id INT=NULL,  
   @Case_Id nvarchar(100)=NULL,  
   @DateOfService_Start DATETIME=NULL,  
   @DateOfService_End DATETIME=NULL,  
   @Claim_Amount MONEY=NULL,  
   @Paid_Amount MONEY=NULL, 
   @WriteOff  MONEY=NULL,
   @Date_BillSent DATETIME=NULL,  
   @DenialReason_ID NVARCHAR(300)=NULL,  
   @ServiceType NVARCHAR(300)=NULL,
   @PeerReviewDoctor NVARCHAR(300)=NULL, 
   @UserID nvarchar(100),
   @Bill_Number varchar(50),
   --@Operating_doctor nvarchar(100),
   @Fee_Schedule numeric(18,2),
   @TreatingDoctor_ID NVARCHAR(300)=NULL,
   @DenialDate Datetime = null,
   @IMEDate Datetime = null,
   @Note  NVARCHAR(300)=NULL,
   @RefundDate Datetime = null
)
AS  
  
BEGIN  


	DECLARE @s_l_OldStatus VARCHAR(200)
	DECLARE @s_l_NewStatus VARCHAR(200)
	DECLARE @s_l_DESC VARCHAR(200)


  DECLARE @NOTES VARCHAR(200)

	 UPDATE tblTreatment
	 SET 
	   DateOfService_Start	=	Convert(nvarchar(15), @DateOfService_Start, 101),  
	   DateOfService_End	=	Convert(nvarchar(15), @DateOfService_End, 101),  
	   Claim_Amount	=	@Claim_Amount,  
	   Paid_Amount	=	@Paid_Amount,  
	   Date_BillSent	=	Convert(varchar(10),@Date_BillSent, 101),   
	   SERVICE_TYPE	=	@ServiceType,
	   BILL_NUMBER	=	@Bill_Number,
	   Fee_Schedule	=	@Fee_Schedule,
	   DenialReason_Id	=	@DenialReason_ID,
	   PeerReviewDoctor_ID	=	@PeerReviewDoctor,
	   TreatingDoctor_ID	=	@TreatingDoctor_ID,
	   DomainId	=	@DomainId,
	   DenialDate = @DenialDate,
	   IMEDate	=	@IMEDate,
	   Notes    =   @Note,
	   WriteOff =   @WriteOff,
	   refund_date = @RefundDate
	   
	 
	 WHERE Treatment_Id=@Treatment_Id
 

 
SET @NOTES = 'Bill updated for DOS ' + convert(varchar(20),@DateOfService_Start) + ' - ' + convert(varchar(20),@DateOfService_end)
exec LCJ_AddNotes @DomainId=@DomainId, @case_id=@case_id,@notes_type='Activity',@Ndesc=@NOTES,@User_id=@UserID,@Applytogroup=0


		IF Exists(SELECT Status FROM tblCASE WHERE case_id = @Case_Id and DomainId = @DomainId and case_id like 'ACT%') and  @DenialDate IS NOT NULL AND @DomainID IN ('AF','LOCALHOST')
		BEGIN
			SET @s_l_OldStatus = (SELECT Status FROM tblCASE WHERE case_id = @Case_Id and DomainId = @DomainId)
			SET @s_l_NewStatus = 'BILLING - DENIAL'
			SET @s_l_DESC = 'Status changed from ' + @s_l_OldStatus  + ' to ' + @s_l_NewStatus

			UPDATE TBLCASE SET STATUS = @s_l_NewStatus WHERE Case_Id = @Case_Id
			UPDATE TBLCASE SET Date_Status_Changed = @DenialDate WHERE Case_Id = @Case_Id

			exec LCJ_AddNotes @DomainId=@DomainId, @case_id=@Case_Id,@notes_type='Activity' ,@NDesc=@s_l_DESC,@user_id='system',@applytogroup=0
			
		END

		IF Exists(SELECT Status FROM tblCASE WHERE case_id = @Case_Id and DomainId = @DomainId and case_id like 'ACT%') and  @DenialDate IS NOT NULL AND @DomainID IN ('AF','LOCALHOST')
		BEGIN
			SET @s_l_OldStatus = (SELECT Status FROM tblCASE WHERE case_id = @Case_Id and DomainId = @DomainId)
			SET @s_l_NewStatus = 'BILLING - DENIAL'
			SET @s_l_DESC = 'Status changed from ' + @s_l_OldStatus  + ' to ' + @s_l_NewStatus

			UPDATE TBLCASE SET STATUS = @s_l_NewStatus WHERE Case_Id = @Case_Id
			UPDATE TBLCASE SET Date_Status_Changed = @DenialDate WHERE Case_Id = @Case_Id

			exec LCJ_AddNotes @DomainId=@DomainId, @case_id=@Case_Id,@notes_type='Activity' ,@NDesc=@s_l_DESC,@user_id='system',@applytogroup=0
			
		END


END
GO
