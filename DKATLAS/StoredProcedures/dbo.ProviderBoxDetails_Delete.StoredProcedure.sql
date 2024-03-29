USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[ProviderBoxDetails_Delete]    Script Date: 6/17/2019 2:54:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[ProviderBoxDetails_Delete]
(
	@i_a_BatchAutoId			INT,
	@s_a_BatchNumber			VARCHAR(100),

	@s_a_Created_By_User	VARCHAR(100)
  
)

AS
BEGIN
	 DECLARE @s_l_message				NVARCHAR(500),
			 @s_l_notes_desc			NVARCHAR(500)

    
	 BEGIN
		IF EXISTS(SELECT BatchCode FROM tblcase WHERE BatchCode = @s_a_BatchNumber )
		
	    BEGIN
	       SET @s_l_message	=  'Batch Code exists in case ..!!!'
	    END
	    ELSE
	    BEGIN
			BEGIN TRAN
	        
	        DELETE FROM tblProvListBoxDetails  WHERE Batch_AutoId = @i_a_BatchAutoId  
	        
			SET @s_l_message	= 'Batch deleted successfully'
			SET @s_l_notes_desc = 'Batch deleted - ' + @s_a_BatchNumber 
		    
		    EXEC F_AdminNotes_Add @s_a_notes_desc=@s_l_notes_desc,@s_a_user_Id=@s_a_Created_By_User,@s_a_notes_type='Batch'
		    
		    COMMIT TRAN 
		END	
						
	 END	
	 SELECT @s_l_message AS [MESSAGE]
END

GO
