USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[SP_DELETE_VERIFICATION_REQUEST]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DELETE_VERIFICATION_REQUEST]
	@I_VERIFICATION_ID INT
as
begin
	DELETE FROM tbl_verification_response_fax_attachments WHERE I_VERIFICATION_ID = @I_VERIFICATION_ID
	DELETE FROM TXN_VERIFICATION_REQUEST where I_VERIFICATION_ID = @I_VERIFICATION_ID
end

GO
