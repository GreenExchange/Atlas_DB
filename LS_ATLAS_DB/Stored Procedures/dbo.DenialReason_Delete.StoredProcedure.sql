USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[DenialReason_Delete]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DenialReason_Delete]
(
   @i_a_Denial_ID       INT,
   @s_a_DenialReason    VARCHAR(100),
   @s_a_DomainID        VARCHAR(50),
   @s_a_Created_By_User VARCHAR(100)
  
)
AS
BEGIN
	 DECLARE @s_l_message				NVARCHAR(500),
			 @s_l_notes_desc			NVARCHAR(500)
			 		
	 BEGIN
		IF EXISTS(SELECT DenialReasons_Type FROM tblcase WHERE DenialReasons_Type = @s_a_DenialReason and  DomainID =@s_a_DomainID )
		OR EXISTS(SELECT FK_Denial_ID FROM tbl_Case_Denial WHERE FK_Denial_ID = @i_a_Denial_ID and  DomainID =@s_a_DomainID)
	    BEGIN
	       SET @s_l_message	=  'Denial reason exists in Case..!!!'
	    END
	    ELSE
			
	 BEGIN
	
			BEGIN TRAN	        
	        DELETE FROM MST_DenialReasons  WHERE PK_Denial_ID = @i_a_Denial_ID and  DomainID =@s_a_DomainID 
	        
			SET @s_l_message= 'Denial reason deleted'
			SET @s_l_notes_desc = 'Denial reason deleted - ' + @s_a_DenialReason 
		    
		    EXEC F_AdminNotes_Add @s_a_notes_desc=@s_l_notes_desc,@s_a_user_Id=@s_a_Created_By_User,@s_a_notes_type='DenialReason',@DomainID =@s_a_DomainID 
		    
		    COMMIT TRAN 
		END	
		
		SELECT @s_l_message AS [MESSAGE]
		
	 END	
END

GO
