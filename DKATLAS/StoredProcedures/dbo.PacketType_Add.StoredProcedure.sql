USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[PacketType_Add]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PacketType_Add]
(
    @i_a_CaseType_Id INT,
    @s_a_CaseType VARCHAR(100), 
    @s_a_Created_By_User VARCHAR(100)
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	--select * from MST_PacketCaseType
	--CaseType_ID	CaseType
	SET NOCOUNT ON;
	DECLARE @i_l_result	INT
	DECLARE @s_l_message	NVARCHAR(500)
	DECLARE @s_l_CaseType	VARCHAR(200)
	DECLARE @s_l_notes_desc	NVARCHAR(MAX)
	
	IF( @i_a_CaseType_Id = 0)
	BEGIN
	    IF EXISTS(SELECT CaseType FROM MST_PacketCaseType WHERE CaseType =  @s_a_CaseType)
	    BEGIN
	       SET @s_l_message	=  'Packet Type already exists..!!!'
		   SET @i_l_result		=  SCOPE_IDENTITY()
	    END
	    ELSE
	    BEGIN
	          BEGIN TRAN
		      INSERT INTO MST_PacketCaseType
		      (
			      CaseType,				
			      created_by_user,
			      created_date
		      )
		      VALUES
		      (
                   @s_a_CaseType,			
                  @s_a_Created_By_User,
                  GETDATE()
		      )
		      SET @s_l_message	=  'Packet Type details saved successfully'
		      SET @i_l_result		=  SCOPE_IDENTITY()
		      
		      
		      SET @s_l_notes_desc = 'Added Packet Type-'+	  @s_a_CaseType	


		      EXEC F_AdminNotes_Add @s_a_notes_desc=@s_l_notes_desc,@s_a_User_Id = @s_a_Created_By_User,@s_a_notes_type='Packet Type' 
		      COMMIT TRAN 
	    END		
	END
	ELSE
	BEGIN
		IF NOT EXISTS(SELECT CaseType FROM MST_PacketCaseType WHERE CaseType =  @s_a_CaseType  and CaseType <>  @s_a_CaseType)
		BEGIN
			BEGIN TRAN
		
			DECLARE @oldCaseType VARCHAR(200)

			SET @oldCaseType = (SELECT TOP 1 CaseType FROM MST_PacketCaseType WHERE  PK_CaseType_Id =  @i_a_CaseType_Id  )
		
			IF( @s_a_CaseType<> @oldCaseType)
			BEGIN
				UPDATE MST_PacketCaseType
				SET 
					 CaseType		=  @s_a_CaseType,
					 modified_by_user	= @s_a_Created_By_User,
					 modified_date		= GETDATE()
				WHERE 
					 PK_CaseType_Id =  @i_a_CaseType_Id
					

				--UPDATE tblCASE
				--SET Initial_Status=  @s_a_CaseType
				--WHERE Initial_Status = @oldCaseType  

				SET @s_l_notes_desc = 'Packet Type Status-' + @oldCaseType + ' to '+	@oldCaseType +  @s_a_CaseType	
				EXEC F_AdminNotes_Add @s_a_notes_desc=@s_l_notes_desc,@s_a_User_Id = @s_a_Created_By_User,@s_a_notes_type='Case Type' 
		      
			END

			SET @s_l_message	=  'Packet Type details updated successfuly'
			SET @i_l_result	=   @i_a_CaseType_Id
                                   
			COMMIT TRAN		
		END
		ELSE
		BEGIN
			SET @s_l_message	=  'Cannot save, Packet Type already exist...' 
			SET @i_l_result	=   @i_a_CaseType_Id
		END			
	END
	SELECT @s_l_message AS [MESSAGE], @i_l_result AS [RESULT]	

END
GO
