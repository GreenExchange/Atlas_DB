USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[Status_Delete]    Script Date: 6/17/2019 2:54:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[Status_Delete]
(
	@i_a_Status_Id			INT,
	@s_a_Status				VARCHAR(100),
	@s_a_Created_By_User	VARCHAR(100)
  
)

AS
BEGIN
	 DECLARE @s_l_message				NVARCHAR(500),
			 @s_l_notes_desc			NVARCHAR(500)
			
	 BEGIN
		IF EXISTS(SELECT Status FROM tblcase WHERE Status = @s_a_Status  )
	    BEGIN
	       SET @s_l_message	=  'Status exists in Case..!!!'
	    END
	    ELSE
	    BEGIN
			BEGIN TRAN
	        
	        DELETE FROM tblStatus  WHERE Status_Id = @i_a_Status_Id  
	        
			SET @s_l_message	= 'Status deleted'
			SET @s_l_notes_desc = 'Status deleted - ' + @s_a_Status 
		    
		    EXEC F_AdminNotes_Add @s_a_notes_desc=@s_l_notes_desc,@s_a_user_Id=@s_a_Created_By_User,@s_a_notes_type='Status'
		    
		    COMMIT TRAN 
		END	
		
		SELECT @s_l_message AS [MESSAGE]
		
	 END	
END

GO
