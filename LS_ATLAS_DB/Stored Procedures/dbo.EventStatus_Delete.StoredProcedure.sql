USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[EventStatus_Delete]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[EventStatus_Delete]
(
		 @i_a_EventStatusId      INT,
		 @s_a_EventStatusName		 VARCHAR(100),
         @s_a_DomainID			 VARCHAR(50),
	     @s_a_Created_By_User	 VARCHAR(100) 
)
AS
BEGIN
	 DECLARE @s_l_message					NVARCHAR(500),
			 @s_l_notes_desc				NVARCHAR(500)
			
	 BEGIN
		IF EXISTS(select EventStatusId from tblEvent WHERE EventStatusId = @i_a_EventStatusId and  DomainID = @s_a_DomainID)
	    BEGIN
	       SET @s_l_message	=  'Event Status exists in Case..!!!'
	    END
	    ELSE
	    BEGIN
			BEGIN TRAN
	        
	        DELETE FROM tblEventStatus  WHERE EventStatusId = @i_a_EventStatusId and  DomainID =@s_a_DomainID 
	        
			SET @s_l_message= 'Event Status deleted'
			SET @s_l_notes_desc = 'Event Status deleted - ' + @s_a_EventStatusName 
		    
		    EXEC F_AdminNotes_Add @s_a_notes_desc=@s_l_notes_desc,@s_a_user_Id=@s_a_Created_By_User,@s_a_notes_type='Event Status',@DomainID =@s_a_DomainID 
		    
		    COMMIT TRAN 
		END	
		
		SELECT @s_l_message AS [MESSAGE]
		
	 END	
END
GO
