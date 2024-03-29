USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[Rebuttal_Status_Add]    Script Date: 6/17/2019 2:54:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Rebuttal_Status_Add]
(
   @i_a_Rebuttal_Status_Id INT,
   @s_a_Rebuttal_Status VARCHAR(100),
   @s_a_Created_By_User VARCHAR(100)
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	--select * from Rebuttal_Status
	--Rebuttal_Status_ID	Rebuttal_Status
	SET NOCOUNT ON;
	DECLARE @i_l_result	INT
	DECLARE @s_l_message	NVARCHAR(500)
	DECLARE @s_l_Rebuttal_StatusType	VARCHAR(200)
	DECLARE @s_l_notes_desc	NVARCHAR(MAX)
	
	IF(@i_a_Rebuttal_Status_Id = 0)
	BEGIN
	    IF EXISTS(SELECT Rebuttal_Status FROM Rebuttal_Status WHERE Rebuttal_Status = @s_a_Rebuttal_Status )
	    BEGIN
	       SET @s_l_message	=  'Rebuttal Status already exists..!!!'
		   SET @i_l_result		=  SCOPE_IDENTITY()
	    END
	    ELSE
	    BEGIN
	          BEGIN TRAN
		      INSERT INTO Rebuttal_Status
		      (
			      Rebuttal_Status,
			      created_by_user,
			      created_date
		      )
		      VALUES
		      (
                  @s_a_Rebuttal_Status,
                  @s_a_Created_By_User,
                  GETDATE()
		      )
		      SET @s_l_message	=  'Rebuttal Status details saved successfully'
		      SET @i_l_result		=  SCOPE_IDENTITY()
		      
		      
		      SET @s_l_notes_desc = 'Added Rebuttal Status-'+	 @s_a_Rebuttal_Status	


		      EXEC F_AdminNotes_Add @s_a_notes_desc=@s_l_notes_desc,@s_a_User_Id = @s_a_Created_By_User,@s_a_notes_type='Rebuttal Status' 
		      COMMIT TRAN 
	    END		
	END
	ELSE
	BEGIN
		IF NOT EXISTS(SELECT Rebuttal_Status FROM Rebuttal_Status WHERE Rebuttal_Status = @s_a_Rebuttal_Status and PK_Rebuttal_Status_ID <> @i_a_Rebuttal_Status_Id)
		BEGIN
			BEGIN TRAN
		
			DECLARE @oldRebuttal_Status VARCHAR(200)

			SET @oldRebuttal_Status = (SELECT TOP 1 Rebuttal_Status FROM Rebuttal_Status WHERE  PK_Rebuttal_Status_ID = @i_a_Rebuttal_Status_Id  )
		

			

			IF(@s_a_Rebuttal_Status<> @oldRebuttal_Status)
			BEGIN
				UPDATE Rebuttal_Status
				SET 
					 Rebuttal_Status		= @s_a_Rebuttal_Status,
					 modified_by_user	= @s_a_Created_By_User,
					 modified_date		= GETDATE()
				WHERE 
					 PK_Rebuttal_Status_ID = @i_a_Rebuttal_Status_Id
					

				UPDATE tblCASE
				SET Rebuttal_Status= @s_a_Rebuttal_Status
				WHERE Rebuttal_Status = @oldRebuttal_Status 

				SET @s_l_notes_desc = 'Updated Rebuttal Status-'+	 @s_a_Rebuttal_Status	
            
				EXEC F_AdminNotes_Add @s_a_notes_desc=@s_l_notes_desc,@s_a_User_Id = @s_a_Created_By_User,@s_a_notes_type='Rebuttal Status'
		        
			END

			SET @s_l_message	=  'Rebuttal Status details updated successfully'
			SET @i_l_result	=  @i_a_Rebuttal_Status_Id
		
			                                 
			COMMIT TRAN		
		END
		ELSE
		BEGIN
			SET @s_l_message	=  'Cannot save, Rebuttal status already exist...' --Rebuttal Status details updated successfuly'
			SET @i_l_result	=  @i_a_Rebuttal_Status_Id
		END
	END
	SELECT @s_l_message AS [MESSAGE], @i_l_result AS [RESULT]	

END
GO
