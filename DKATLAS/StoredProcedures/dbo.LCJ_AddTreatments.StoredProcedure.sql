USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_AddTreatments]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LCJ_AddTreatments]
(

	@Case_Id nvarchar(100),
	@DateOfService_Start DATETIME,
	@DateOfService_End DATETIME,
	@Claim_Amount MONEY,
	@Paid_Amount MONEY,
	@Date_BillSent	nvarchar(100),
	@DenialReason_ID INT,
	@ServiceType NVARCHAR(300),
	@PeerReviewDoctor INT,
	@UserID nvarchar(100),
	@Account_Number varchar(50),
	@ActionType nvarchar(100),
	@Fee_Schedule numeric(18,2),
	@TreatingDoctor_ID int --,
	--@DenialReasons_Type nvarchar(200)
            --@Treatment_Id int
)
AS
DECLARE @NOTES VARCHAR(200)
		
BEGIN
	
	BEGIN
-- following if/then loop added by Serge on 9/22/08
if @claim_amount < @Paid_amount
BEGIN
SET @NOTES ='Bill Processing Cancelled.Incorrect Bill amount entered for DOS ' + convert(varchar(20),@DateOfService_Start) + ' - ' + convert(varchar(20),@DateOfService_end) + '.  >>XM-005'
	exec LCJ_AddNotes @case_id=@case_id,@notes_type='Activity',@Ndesc=@NOTES,@User_id='SYSTEM',@Applytogroup=0
	RETURN
END
--End of update done by SJR on 9/22/08
		BEGIN TRAN
		--set @DenialReason_ID=(select DenialReasons_Id from tblDenialReasons where DenialReasons_Type=@DenialReasons_Type)
		INSERT INTO tblTreatment
		(
			Case_Id,
			DateOfService_Start,
			DateOfService_End,
			Claim_Amount,
			Paid_Amount,
			Date_BillSent,
			SERVICE_TYPE,
			Account_Number,
			Fee_schedule,
			DenialReason_Id,
			PeerReviewDoctor_ID,
			TreatingDoctor_ID
		)

		VALUES(
		
			@Case_Id,
			Convert(nvarchar(15), @DateOfService_Start, 101),
			Convert(nvarchar(15), @DateOfService_End, 101),			
			@Claim_Amount,
			@Paid_Amount,
			@Date_BillSent,
			@ServiceType,
			@Account_Number,
			@Fee_Schedule,
			@DenialReason_ID,
			@PeerReviewDoctor,
			@TreatingDoctor_ID
			--@CPT_Id
		)	
		
		SET @NOTES = 'Bill added for DOS ' + convert(varchar(12),@DateOfService_Start) + ' - ' + convert(varchar(12),@DateOfService_end)
		exec LCJ_AddNotes @case_id=@case_id,@notes_type='Activity',@Ndesc=@NOTES,@User_id=@UserID,@Applytogroup=0

		COMMIT TRAN
	END -- END of ELSE	

END
GO
