USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[Rebuttal_Status_Delete]    Script Date: 6/17/2019 2:54:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Rebuttal_Status_Delete]
(
   @i_a_Rebuttal_Status_Id INT,
   @s_a_Rebuttal_Status VARCHAR(100),
	@s_a_Created_By_User VARCHAR(100)
  
)

AS
BEGIN
	 DECLARE @s_l_message				NVARCHAR(500),
			 @s_l_notes_desc				NVARCHAR(500)
			
	 BEGIN
		IF EXISTS(SELECT Rebuttal_Status FROM tblcase WHERE Rebuttal_Status = @s_a_Rebuttal_Status  )
	    BEGIN
	       SET @s_l_message	=  'Rebuttal Status exists in Case..!!!'
	    END
	    ELSE
	    BEGIN
			BEGIN TRAN
	        
	        DELETE FROM Rebuttal_Status  WHERE PK_Rebuttal_Status_ID = @i_a_Rebuttal_Status_Id 
	        
			SET @s_l_message= 'Rebuttal Status deleted'
			SET @s_l_notes_desc = 'Rebuttal Status deleted - ' + @s_a_Rebuttal_Status 
		    
		    EXEC F_AdminNotes_Add @s_a_notes_desc=@s_l_notes_desc,@s_a_user_Id=@s_a_Created_By_User,@s_a_notes_type='Rebuttal Status'
		    
		    COMMIT TRAN 
		END	
		
		SELECT @s_l_message AS [MESSAGE]
		
	 END	
END


GO
