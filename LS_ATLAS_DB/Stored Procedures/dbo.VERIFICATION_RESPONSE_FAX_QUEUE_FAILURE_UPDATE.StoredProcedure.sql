USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[VERIFICATION_RESPONSE_FAX_QUEUE_FAILURE_UPDATE]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[VERIFICATION_RESPONSE_FAX_QUEUE_FAILURE_UPDATE]
(
	@DomainID				VARCHAR(50)=NULL,
	@i_verification_id		INT,
	@pk_vr_fax_queue_id		BIGINT
)
AS
BEGIN
	UPDATE
		txn_verification_request
	SET
		FaxStatus				=	'Failed'
	WHERE
		(@DomainID IS NULL OR DomainID	=	@DomainID) AND
		I_VERIFICATION_ID		=	@i_verification_id

	UPDATE
		tbl_verification_response_fax_queue
	SET 
		isDeleted			=	1,
		AddToQueueCount		=	ISNULL(AddToQueueCount,0)+1
	WHERE			
		pk_vr_fax_queue_id	=	@pk_vr_fax_queue_id
	
	SELECT 'Success' AS result
END

GO
