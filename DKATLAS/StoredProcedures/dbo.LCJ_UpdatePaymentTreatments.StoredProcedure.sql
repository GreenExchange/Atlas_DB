USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_UpdatePaymentTreatments]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LCJ_UpdatePaymentTreatments]  --110980,'','01/01/2009','01/01/2009' 
(    
   @Treatment_Id INT=NULL,  
   @Case_Id nvarchar(100)=NULL,  
   @DateOfService_Start DATETIME=NULL,  
   @DateOfService_End DATETIME=NULL,  
   @Claim_Amount MONEY=NULL,  
   @Paid_Amount MONEY=NULL,  
   @Date_BillSent DATETIME=NULL,  
   @DenialReason_ID NVARCHAR(300)=NULL,  
   @ServiceType NVARCHAR(300)=NULL,
   @PeerReviewDoctor NVARCHAR(300)=NULL, 
   @UserID nvarchar(100),
   @Account_Number varchar(50),
   @ActionType nvarchar(100),
   --@Operating_doctor nvarchar(100),
   @Fee_Schedule numeric(18,2),
   @TreatingDoctor_ID NVARCHAR(300)=NULL
   --@Old_TreatingDoctorID INT,
   --@Old_PeerDoctorID INT,
   --@Old_DenialReasonID INT
)
AS  
  
BEGIN  
  DECLARE @NOTES VARCHAR(200)
 UPDATE tblTreatment
 SET 
   DateOfService_Start=Convert(nvarchar(15), @DateOfService_Start, 101),  
   DateOfService_End=Convert(nvarchar(15), @DateOfService_End, 101),  
   Claim_Amount=@Claim_Amount,  
   Paid_Amount=@Paid_Amount,  
   Date_BillSent=Convert(nvarchar(20),@Date_BillSent, 101),   
   SERVICE_TYPE=@ServiceType,
   Account_Number = @Account_Number,
   Action_Type=@ActionType,
   Fee_Schedule =@Fee_Schedule,
   DenialReason_Id=@DenialReason_ID,
   PeerReviewDoctor_ID=@PeerReviewDoctor,
   TreatingDoctor_ID=@TreatingDoctor_ID
   
    
 WHERE Treatment_Id=@Treatment_Id
 
-- IF(@DenialReason_ID<>0)
--BEGIN
--	IF exists ( select * from TXN_tblTreatment where DenialReasons_Id=@Old_DenialReasonID and TREATMENT_ID=@Treatment_Id)
--	BEGIN
--	update 
--	TXN_tblTreatment
--	SET
--	DenialReasons_Id=@DenialReason_ID
--	WHERE 
--	Treatment_Id=@Treatment_Id and DenialReasons_Id=@Old_DenialReasonID
--	END
--ELSE
--BEGIN
--insert into TXN_tblTreatment(DenialReasons_Id,Treatment_Id)			
--			values(@DenialReason_ID,@Treatment_Id)
--END
--END

--IF(@PeerReviewDoctor<>0)
--BEGIN
--	IF exists ( select * from TXN_CASE_PEER_REVIEW_DOCTOR where Doctor_Id=@Old_PeerDoctorID and TREATMENT_ID=@Treatment_Id)
--	BEGIN
--		update TXN_CASE_PEER_REVIEW_DOCTOR
--		SET
--		DOCTOR_ID=@PeerReviewDoctor
--		WHERE TREATMENT_ID=@Treatment_Id and DOCTOR_ID=@Old_PeerDoctorID
--	END
--ELSE
--BEGIN
--insert into TXN_CASE_PEER_REVIEW_DOCTOR values(@Treatment_Id,@PeerReviewDoctor)
--END
--END

--IF(@TreatingDoctor_ID<>0)
--BEGIN
--	if exists ( select * from TXN_CASE_Treating_Doctor where Doctor_Id=@Old_TreatingDoctorID and TREATMENT_ID=@Treatment_Id)
--	BEGIN
--	update TXN_CASE_Treating_Doctor
--	SET
--		DOCTOR_ID=@TreatingDoctor_ID
--	WHERE 
--	TREATMENT_ID=@Treatment_Id and DOCTOR_ID=@Old_TreatingDoctorID
--END
--ELSE
--BEGIN
--	insert into TXN_CASE_Treating_Doctor values(@Treatment_Id,@TreatingDoctor_ID)
--END
--END

SET @NOTES = 'Bill updated for DOS ' + convert(varchar(20),@DateOfService_Start) + ' - ' + convert(varchar(20),@DateOfService_end)
exec LCJ_AddNotes @case_id=@case_id,@notes_type='Activity',@Ndesc=@NOTES,@User_id=@UserID,@Applytogroup=0

END
GO
