USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[batch_print_offline_email_acknowledgement_update]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[batch_print_offline_email_acknowledgement_update] 
	 @key	UNIQUEIDENTIFIER
AS
BEGIN
	UPDATE
		tbl_batch_print_offline_email_fax_status
	SET
		isEmailAcknowledged				=	1,
		emailAcknowledgementDate		=	GETDATE()
	WHERE
		emailAcknowledgementKey			=	@key AND
		ISNULL(isEmailAcknowledged,0)	=	0
END
GO
