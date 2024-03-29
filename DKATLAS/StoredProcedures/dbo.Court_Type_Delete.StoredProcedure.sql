USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[Court_Type_Delete]    Script Date: 6/17/2019 2:53:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[Court_Type_Delete]
( 
	@i_a_Court_Id		  INT,
    @s_a_Court_Name	      VARCHAR(100),
	@s_a_Created_By_User  VARCHAR(100)
  
)

AS
BEGIN
	 DECLARE @s_l_message				NVARCHAR(500),
			 @s_l_notes_desc			NVARCHAR(500)
			
	 BEGIN
		IF EXISTS(SELECT Court_Id FROM tblcase WHERE Court_Id = @i_a_Court_Id )
	    BEGIN
	       SET @s_l_message	=  'Court Type exists in Case..!!!'
	    END
	    ELSE
	    BEGIN
			BEGIN TRAN
	        
	        DELETE FROM tblCourt  WHERE Court_Id = @i_a_Court_Id   
	        
			SET @s_l_message	= 'Court Type deleted'
			SET @s_l_notes_desc = 'Court Type deleted - ' + @s_a_Court_Name 
		    
		    EXEC F_AdminNotes_Add @s_a_notes_desc=@s_l_notes_desc,@s_a_user_Id=@s_a_Created_By_User,@s_a_notes_type='Court_Name' 
		    
		    COMMIT TRAN 
		END	
		
		SELECT @s_l_message AS [MESSAGE]
		
	 END	
END

GO
