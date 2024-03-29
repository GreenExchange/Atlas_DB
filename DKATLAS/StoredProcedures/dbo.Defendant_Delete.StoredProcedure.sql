USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[Defendant_Delete]    Script Date: 6/17/2019 2:53:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[Defendant_Delete]
(
	@i_a_Defendant_Id			INT,
	@s_a_Defendant_Name				VARCHAR(100),
	@s_a_Created_By_User	VARCHAR(100)
  
)

AS
BEGIN
	 DECLARE @s_l_message				NVARCHAR(500),
			 @s_l_notes_desc			NVARCHAR(500)
			
	 BEGIN
		IF EXISTS(SELECT Defendant_Id FROM tblcase WHERE Defendant_Id = @i_a_Defendant_Id  )
	    BEGIN
	       SET @s_l_message	=  'Defendant exists in Case..!!!'
	    END
	    ELSE
	    BEGIN
			BEGIN TRAN
	        
	        DELETE FROM tblDefendant  WHERE Defendant_Id = @i_a_Defendant_Id 
	        
			SET @s_l_message	= 'Defendant deleted'
			SET @s_l_notes_desc = 'Defendant deleted - ' + @s_a_Defendant_Name 
		    
		    EXEC F_AdminNotes_Add @s_a_notes_desc=@s_l_notes_desc,@s_a_user_Id=@s_a_Created_By_User,@s_a_notes_type='Defendant' 
		    
		    COMMIT TRAN 
		END	
		
		SELECT @s_l_message AS [MESSAGE]
		
	 END	
END

GO
