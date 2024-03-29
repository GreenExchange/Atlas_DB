USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[Arbitrator_Delete]    Script Date: 6/17/2019 2:53:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Arbitrator_Delete]
(
   @i_a_ARBITRATOR_ID      INT,
   @s_a_ARBITRATOR_NAME    VARCHAR(100),
   @s_a_Created_By_User    VARCHAR(100)
  
)
AS
BEGIN
	 DECLARE @s_l_message				NVARCHAR(500),
			 @s_l_notes_desc			NVARCHAR(500)
			 		
	 BEGIN
		IF EXISTS(SELECT arbitrator_id FROM tblEvent WHERE arbitrator_id = @i_a_ARBITRATOR_ID  )
		OR EXISTS(SELECT Arbitrator_ID FROM tblcase WHERE Arbitrator_ID = @i_a_ARBITRATOR_ID )
	    BEGIN
	       SET @s_l_message	=  'Arbitrator exists in Case..!!!'
	    END
	    ELSE
			
	 BEGIN
	
			BEGIN TRAN	        
	        DELETE FROM TblArbitrator  WHERE ARBITRATOR_ID = @i_a_ARBITRATOR_ID 
	        
			SET @s_l_message    = 'Arbitrator deleted'
			SET @s_l_notes_desc = 'Arbitrator deleted - ' + @s_a_ARBITRATOR_NAME 
		    
		    EXEC F_AdminNotes_Add @s_a_notes_desc=@s_l_notes_desc,@s_a_user_Id=@s_a_Created_By_User,@s_a_notes_type='Arbitrator'
		    
		    COMMIT TRAN 
		END	
		
		SELECT @s_l_message AS [MESSAGE]
		
	 END	
END

GO
