USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[F_M_User_Delete]    Script Date: 6/17/2019 2:54:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[F_M_User_Delete]
(
   @i_a_User_Id		    INT,
   @s_a_User  VARCHAR(100),
   @s_a_UserName VARCHAR(100)
)

AS
BEGIN
	 DECLARE @s_l_message				NVARCHAR(500),
			@desc						VARCHAR(200),
			@s_l_notes_desc				NVARCHAR(500)
			
	 BEGIN
		  UPDATE IssueTracker_Users SET IsActive=0 WHERE UserId=@i_a_User_Id
		  
		  SET @s_l_message= 'User deleted'
		  SET @s_l_notes_desc = 'User deleted - ' + @s_a_User 
		  
		  EXEC F_AdminNotes_Add @s_a_notes_desc=@s_l_notes_desc,@s_a_user_Id=@s_a_username,@s_a_notes_type='User'
		  
		  SELECT @s_l_message AS [MESSAGE]
	 END	
END
GO
