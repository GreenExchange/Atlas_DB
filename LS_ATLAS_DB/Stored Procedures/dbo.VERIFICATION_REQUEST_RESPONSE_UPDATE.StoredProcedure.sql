USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[VERIFICATION_REQUEST_RESPONSE_UPDATE]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[VERIFICATION_REQUEST_RESPONSE_UPDATE]
	@DomainID					VARCHAR(50)=NULL,
	@i_verification_id			INT,
	@ReplyNotes					VARCHAR(MAX)=NULL,
	@FaxImageID					VARCHAR(MAX)=NULL,
	@FaxQueueID					BIGINT=NULL,
	@FaxAcknowledgementImageID	BIGINT=NULL
AS
BEGIN
	DECLARE @SZ_CASE_ID		VARCHAR(MAX) = ''
	DECLARE @s_l_OldStatus	VARCHAR(200) = ''
	DECLARE @s_l_NewStatus	VARCHAR(200) = ''
	DECLARE @s_l_DESC		VARCHAR(200) = ''

	IF(@ReplyNotes IS NOT NULL)
	BEGIN
		UPDATE
			txn_verification_request
		SET 
			VerificationResponse	=	@ReplyNotes
		WHERE
			(@DomainID IS NULL OR DomainID	=	@DomainID) AND
			I_VERIFICATION_ID		=	@i_verification_id
	END
	
	IF(ISNULL(@FaxImageID,'') <> '')
	BEGIN
		UPDATE
			txn_verification_request
		SET
			FaxStatus			=	'Scheduled'
		WHERE
			(@DomainID IS NULL OR DomainID	=	@DomainID) AND
			I_VERIFICATION_ID		=	@i_verification_id

		UPDATE
			tbl_verification_response_fax_attachments
		SET
			IsDeleted			=	1
		WHERE
			I_VERIFICATION_ID	=	@i_verification_id

		INSERT INTO tbl_verification_response_fax_attachments
		(
			I_VERIFICATION_ID,
			FaxImageID,
			DomainID,
			IsDeleted
		)
		SELECT @i_verification_id,items,@DomainID,0 FROM dbo.STRING_SPLIT(@FaxImageID,',')
	END

	IF(@FaxQueueID IS NOT NULL)
	BEGIN
		UPDATE
			txn_verification_request
		SET 
			FaxQueueID				=	@FaxQueueID
		WHERE
			(@DomainID IS NULL OR DomainID	=	@DomainID) AND
			I_VERIFICATION_ID		=	@i_verification_id
	END

	IF(@FaxAcknowledgementImageID IS NOT NULL)
	BEGIN

		SELECT TOP 1 @SZ_CASE_ID	=	SZ_CASE_ID	FROM TXN_VERIFICATION_REQUEST WHERE I_VERIFICATION_ID	=	@i_verification_id AND DomainID	= @DomainID

		IF Exists(SELECT Status FROM tblCASE WHERE case_id = @SZ_CASE_ID and DomainId = @DomainID and LOWER(Initial_Status) = 'active')
		BEGIN
			IF LOWER(@DomainID) IN ('af','localhost')
			BEGIN 
				SET @s_l_OldStatus = (SELECT Status FROM tblCASE WHERE case_id = @SZ_CASE_ID and DomainId = @DomainID)
				SET @s_l_NewStatus = 'BILLING - VERIFICATION ANSWERED'
				SET @s_l_DESC = 'Status changed from ' + @s_l_OldStatus  + ' to ' + @s_l_NewStatus

				UPDATE TBLCASE SET STATUS = @s_l_NewStatus WHERE Case_Id = @SZ_CASE_ID
				UPDATE TBLCASE SET Date_Status_Changed = GETDATE() WHERE Case_Id = @SZ_CASE_ID

				exec LCJ_AddNotes @DomainID=@DomainID, @case_id=@SZ_CASE_ID,@notes_type='Activity' ,@NDesc=@s_l_DESC,@user_id='system',@applytogroup=0
			END
			ELSE
			BEGIN 
				SET @s_l_OldStatus = (SELECT Status FROM tblCASE WHERE case_id = @SZ_CASE_ID and DomainId = @DomainId)
				SET @s_l_NewStatus = 'BILLING - VERIFICATION'
				SET @s_l_DESC = 'Status changed from ' + @s_l_OldStatus  + ' to ' + @s_l_NewStatus

				UPDATE TBLCASE SET STATUS = @s_l_NewStatus WHERE Case_Id = @SZ_CASE_ID
				UPDATE TBLCASE SET Date_Status_Changed = GETDATE() WHERE Case_Id = @SZ_CASE_ID

				exec LCJ_AddNotes @DomainId=@DomainId, @case_id=@SZ_CASE_ID,@notes_type='Activity' ,@NDesc=@s_l_DESC,@user_id='system',@applytogroup=0
			END
		END		

		UPDATE
			txn_verification_request
		SET 
			FaxAcknowledgementImageID	=	@FaxAcknowledgementImageID,
			FaxStatus					=	'Delivered'
		WHERE
			(@DomainID IS NULL OR DomainID	=	@DomainID) AND
			I_VERIFICATION_ID		=	@i_verification_id
	END
END

GO
