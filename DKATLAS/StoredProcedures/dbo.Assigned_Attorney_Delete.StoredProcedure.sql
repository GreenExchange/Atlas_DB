USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[Assigned_Attorney_Delete]    Script Date: 6/17/2019 2:53:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[Assigned_Attorney_Delete]
(
   @i_a_Assigned_Attorney_Id INT,
   @s_a_Assigned_Attorney VARCHAR(100),  
   @s_a_Created_By_User VARCHAR(100)
  
)

AS
BEGIN
	 DECLARE @s_l_message				NVARCHAR(500),
			 @s_l_notes_desc				NVARCHAR(500)
			
	 BEGIN
		IF EXISTS(SELECT Assigned_Attorney FROM tblcase WHERE Assigned_Attorney = @s_a_Assigned_Attorney )
	    BEGIN
	       SET @s_l_message	=  'Assigned Attorney exists in Case..!!!'
	    END
	    ELSE
	    BEGIN
			BEGIN TRAN
	        
	        DELETE FROM Assigned_Attorney  WHERE PK_Assigned_Attorney_ID = @i_a_Assigned_Attorney_Id 
	        
			SET @s_l_message= 'Assigned Attorney deleted'
			SET @s_l_notes_desc = 'Assigned Attorney deleted - ' + @s_a_Assigned_Attorney 
		    
		    EXEC F_AdminNotes_Add @s_a_notes_desc=@s_l_notes_desc,@s_a_user_Id=@s_a_Created_By_User,@s_a_notes_type='Assigned Attorney' 
		    
		    COMMIT TRAN 
		END	
		
		SELECT @s_l_message AS [MESSAGE]
		
	 END	
END
--------------------------------------------------------------------------------------------------------------------------------------------------------------


/****** Object:  StoredProcedure [dbo].[Assigned_Attorney_Retrive]    Script Date: 8/7/2018 12:36:35 PM ******/
SET ANSI_NULLS ON
GO
