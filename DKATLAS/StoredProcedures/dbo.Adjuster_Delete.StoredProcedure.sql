USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[Adjuster_Delete]    Script Date: 6/17/2019 2:53:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[Adjuster_Delete]
(
	@i_a_Adjuster_Id			INT,
	@s_a_Adjuster_Name			VARCHAR(100),

	@s_a_Created_By_User	    VARCHAR(100)
  
)

AS
BEGIN
	 DECLARE @s_l_message				NVARCHAR(500),
			 @s_l_notes_desc			NVARCHAR(500)
			
	 BEGIN
		IF EXISTS(SELECT Adjuster_Id FROM tblcase WHERE Adjuster_Id = @i_a_Adjuster_Id )
	    BEGIN
	       SET @s_l_message	=  'Adjuster exists in Case..!!!'
	    END
	    ELSE
	    BEGIN
			BEGIN TRAN
	        
	        DELETE FROM tblAdjusters  WHERE Adjuster_Id = @i_a_Adjuster_Id 
	        
			SET @s_l_message	= 'Adjuster deleted'
			SET @s_l_notes_desc = 'Adjuster deleted - ' + @s_a_Adjuster_Name 
		    
		    EXEC F_AdminNotes_Add @s_a_notes_desc=@s_l_notes_desc,@s_a_user_Id=@s_a_Created_By_User,@s_a_notes_type='Adjuster' 
		    
		    COMMIT TRAN 
		END	
		
		SELECT @s_l_message AS [MESSAGE]
		
	 END	
END

GO
