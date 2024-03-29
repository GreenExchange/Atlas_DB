USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[ProviderBoxDetails_Add]    Script Date: 6/17/2019 2:54:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ProviderBoxDetails_Add]
(
	@i_a_BatchAuto_Id int,
	@s_a_BatchNumber varchar(100),
	@i_a_Provider_id int,
	@s_a_No_Of_Cases varchar(200),
	@s_a_created_by_user varchar(255)	
)
AS
BEGIN

	SET NOCOUNT ON;
	DECLARE @i_l_result				INT
	DECLARE @s_l_message			NVARCHAR(500)
	DECLARE @s_l_notes_desc			NVARCHAR(MAX)
	
	

	IF(@i_a_BatchAuto_Id = 0)
	BEGIN
		DECLARE @s_l_BatchNumber varchar(100)
		DECLARE	@s_l_MaxBatch_Number AS VARCHAR(100)  
		DECLARE @i_l_MaxBatch_No AS INTEGER    

		SET @s_l_MaxBatch_Number=ISNULL((SELECT top 1 Batch_No FROM tblProvListBoxDetails  ORDER BY Batch_AutoId DESC),'100000')
		SET @i_l_MaxBatch_No = (SELECT top 1 items + 1 FROM dbo.[STRING_SPLIT](@s_l_MaxBatch_Number,'-') Order by autoid desc)
		SET @s_l_BatchNumber  = 'BATCH-' + CAST(@i_l_MaxBatch_No AS NVARCHAR)
		
		--print @s_l_BatchNumber
		 BEGIN TRAN
				INSERT INTO tblProvListBoxDetails (
					
					  Batch_No
					, Provider_ID
					, No_Of_Cases
					, Created_By_User
					, Created_Date)
				VALUES (
					
					 @s_l_BatchNumber
					, @i_a_Provider_id
					, @s_a_No_Of_Cases
					, @s_a_created_by_user
					, GETDATE())  
			SET @s_l_message		=  'Batch details saved successfully'
			SET @i_l_result		=  SCOPE_IDENTITY()		      
			SET @s_l_notes_desc = 'Batch Added -'+	 @s_l_BatchNumber
			EXEC F_AdminNotes_Add @s_a_notes_desc=@s_l_notes_desc,@s_a_User_Id = @s_a_Created_By_User,@s_a_notes_type='Batch'
		COMMIT TRAN 
	END
	ELSE
	BEGIN
		BEGIN TRAN
			UPDATE tblProvListBoxDetails
			SET 		
				Provider_ID =@i_a_Provider_id,
				No_Of_Cases=@s_a_No_Of_Cases,			
				modified_by_user=@s_a_created_by_user,
				modified_date= GETDATE()
			WHERE 
				Batch_AutoId = @i_a_BatchAuto_Id
				
			SET @s_l_message	=  'Batch details updated successfully'
			SET @i_l_result		=  @i_a_BatchAuto_Id

			
			SET @s_l_notes_desc = 'Updated Batch -'+	 @s_l_BatchNumber 
            
		    EXEC F_AdminNotes_Add @s_a_notes_desc=@s_l_notes_desc,@s_a_User_Id = @s_a_Created_By_User,@s_a_notes_type='Batch'
		   
		COMMIT TRAN

	END
	SELECT @s_l_message AS [MESSAGE], @i_l_result AS [RESULT]	
END
--					
GO
