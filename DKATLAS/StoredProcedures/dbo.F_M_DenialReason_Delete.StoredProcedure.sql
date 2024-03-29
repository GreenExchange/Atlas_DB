USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[F_M_DenialReason_Delete]    Script Date: 6/17/2019 2:54:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[F_M_DenialReason_Delete]
		(
			@i_a_DenialReason_id		    INT,
			@s_l_username				NVARCHAR(100)
		)

AS
BEGIN
	 DECLARE @s_l_message				NVARCHAR(500),
			@desc						VARCHAR(200),
			@s_l_notes_desc				NVARCHAR(500),
			@s_l_DenialReason		    NVARCHAR(200)
	 BEGIN
	 
		SELECT @s_l_DenialReason= DenialReason FROM MST_DenialReasons WHERE PK_Denial_ID=@i_a_DenialReason_id
		
		DELETE FROM MST_DenialReasons WHERE PK_Denial_ID=@i_a_DenialReason_id
			 SET @s_l_message='DenialReason deleted'
			 SET @s_l_notes_desc = 'DenialReason deleted:'+@s_l_DenialReason
			 EXEC F_AdminNotes_Add @s_a_notes_desc=@s_l_notes_desc,@s_a_user_Id=@s_l_username,@s_a_notes_type='DenialReason'
			 SELECT @s_l_message AS [MESSAGE]
	 END	
END
GO
