USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[Update_Verification_Response_Fax_Queue_Progress_Download]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Update_Verification_Response_Fax_Queue_Progress_Download] 
	@i_a_pk_vr_fax_queue_id int,  
	@s_a_DomainId varchar(50),  
	@b_a_inprogress_download bit  
AS
BEGIN

	SET NOCOUNT ON;

	Update tbl_verification_response_fax_queue Set inprogress_download = @b_a_inprogress_download 
	Where DomainID = @s_a_DomainId and pk_vr_fax_queue_id = @i_a_pk_vr_fax_queue_id
END
GO
