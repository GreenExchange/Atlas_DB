USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[F_Case_Update_ArbitratorName]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE[dbo].[F_Case_Update_ArbitratorName]    
(    
	@s_a_case_id			NVARCHAR(10),  
	@s_a_user_name			NVARCHAR(50),
	@s_a_case_ArbitratorName_old	NVARCHAR(200),        	
	@s_a_case_ArbitratorName_new	NVARCHAR(200),
	@s_a_case_Arbitratorid	NVARCHAR(10)
)    
AS    
BEGIN      
	SET NOCOUNT ON     

	DECLARE @s_l_message VARCHAR(MAX)  
	DECLARE @desc varchar(200)
	
	
	UPDATE tblcase 
	SET Arbitrator_Id = @s_a_case_Arbitratorid
	WHERE Case_Id = @s_a_case_id

	SET @desc = 'ArbitratorName changed from ' + @s_a_case_ArbitratorName_old +' to '+@s_a_case_ArbitratorName_new
	exec F_Add_Activity_Notes @s_a_case_id=@s_a_Case_Id,@s_a_notes_type='Activity',@s_a_ndesc = @desc,@s_a_user_Id=@s_a_user_name,@i_a_applytogroup = 0
			
	SET @s_l_message = 'Case ArbitratorName updated successfully'   
  
	SELECT @s_l_message AS [MESSAGE], @s_a_case_id AS [RESULT],Arbitrator_Name,tblcase.Arbitrator_Id FROM tblcase 
	INNER JOIN tblArbitrator ON tblArbitrator.Arbitrator_Id = tblcase.Arbitrator_Id
	WHERE Case_Id =    @s_a_case_id    
	
	SET NOCOUNT OFF       
END

GO
