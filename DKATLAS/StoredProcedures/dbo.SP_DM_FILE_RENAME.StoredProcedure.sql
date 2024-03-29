USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[SP_DM_FILE_RENAME]    Script Date: 6/17/2019 2:54:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[SP_DM_FILE_RENAME]
(      
	@i_a_image_id BIGINT,    
	@s_a_file_name VARCHAR(MAX),    	
	@i_a_user_id int =0   ,
	@i_a_from_flag	int=2
)      
AS      
BEGIN      
	UPDATE 
		tblDocImages   
	SET 
		Filename=@s_a_file_name,
		from_flag=@i_a_from_flag	
	WHERE 
		imageid=@i_a_image_id
		
	UPDATE 
		tblImageTag
	SET 
		DateModified=GETDATE()
	WHERE 
		IMAGEID=@i_a_image_id
		
	IF EXISTS(SELECT 1 FROM tbl_ImageTag_Modifiedby WHERE imageid =@i_a_image_id)
		BEGIN
			UPDATE 
				tbl_ImageTag_Modifiedby   
			SET 
				modified_by=@i_a_user_id
			WHERE	
				imageid=@i_a_image_id
		END
	ELSE
		BEGIN
			INSERT INTO tbl_ImageTag_Modifiedby
			VALUES(@i_a_image_id,@i_a_user_id)
		END
	
END
GO
