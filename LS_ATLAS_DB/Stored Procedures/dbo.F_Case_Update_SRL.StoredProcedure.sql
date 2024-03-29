USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[F_Case_Update_SRL]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[F_Case_Update_SRL]    
(    
	@s_a_case_id			NVARCHAR(10),  
	@s_a_user_name			NVARCHAR(50),
	@s_a_case_SRL_old	NVARCHAR(200),        	
	@s_a_case_SRL_new	NVARCHAR(200),
	@s_a_case_SRL_locationid NVARCHAR(10)
)    
AS    
BEGIN      
	SET NOCOUNT ON     

	DECLARE @s_l_message VARCHAR(MAX)  
	DECLARE @desc varchar(200)
	
	
	UPDATE tblcase 
	SET location_id = @s_a_case_SRL_locationid
	WHERE Case_Id = @s_a_case_id

	SET @desc = 'Render Location changed from ' + @s_a_case_SRL_old +' to '+@s_a_case_SRL_new
	exec F_Add_Activity_Notes @s_a_case_id=@s_a_Case_Id,@s_a_notes_type='Activity',@s_a_ndesc = @desc,@s_a_user_Id=@s_a_user_name,@i_a_applytogroup = 0
			
	SET @s_l_message = 'Case Render Location updated successfully'   
  
	SELECT @s_l_message AS [MESSAGE], @s_a_case_id AS [RESULT],@s_a_case_SRL_new as [SRL_Name] ,@s_a_case_SRL_locationid as[location_Id] FROM tblcase  
	INNER JOIN MST_Service_Rendered_Location ON MST_Service_Rendered_Location.Location_Id = tblcase.location_id
	WHERE Case_Id =    @s_a_case_id    
	
	SET NOCOUNT OFF       
END

GO
