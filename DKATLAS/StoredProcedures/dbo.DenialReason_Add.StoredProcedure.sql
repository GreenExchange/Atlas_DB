USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[DenialReason_Add]    Script Date: 6/17/2019 2:54:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DenialReason_Add]
(
   @i_a_Denial_ID		INT,
   @s_a_DenialReason    VARCHAR(100),
   @s_a_Created_By_User VARCHAR(100)
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	--select * from MST_DenialReasons
	--Denial_ID	DenialReason
	SET NOCOUNT ON;
	DECLARE @i_l_result	           INT
	DECLARE @s_l_message	       NVARCHAR(500)
	DECLARE @s_l_DenialReasonType  VARCHAR(200)
	DECLARE @s_l_notes_desc	       NVARCHAR(MAX)
	
	IF(@i_a_Denial_ID = 0)
	BEGIN
	    IF EXISTS(SELECT DenialReason FROM MST_DenialReasons WHERE DenialReason = @s_a_DenialReason)
	    BEGIN
	       SET @s_l_message	=  'Denial reason already exists..!!!'
		   SET @i_l_result		=  SCOPE_IDENTITY()
	    END
	    ELSE
	    BEGIN
	          BEGIN TRAN
		      INSERT INTO MST_DenialReasons
		      (
			      DenialReason,
				
			      created_by_user,
			      created_date
		      )
		      VALUES
		      (
                  @s_a_DenialReason,				 
                  @s_a_Created_By_User,
                  GETDATE()
		      )
		      SET @s_l_message	=  'Denial reason saved successfully'
		      SET @i_l_result	=  SCOPE_IDENTITY()		     		      
		      SET @s_l_notes_desc = 'Added Denial reason-'+	 @s_a_DenialReason	

		      EXEC F_AdminNotes_Add @s_a_notes_desc=@s_l_notes_desc,@s_a_User_Id = @s_a_Created_By_User,@s_a_notes_type='DenialReason' 
		      COMMIT TRAN 
	    END		
	END
	ELSE
	BEGIN
		BEGIN TRAN
		
		DECLARE @oldDenialReason VARCHAR(200)

		SET @oldDenialReason = (SELECT TOP 1 DenialReason FROM MST_DenialReasons WHERE  PK_Denial_ID = @i_a_Denial_ID )
		
		IF NOT EXISTS(SELECT TOP 1 DenialReason FROM MST_DenialReasons WHERE  PK_Denial_ID <>  @i_a_Denial_ID and DenialReason= @s_a_DenialReason  )
		BEGIN
			UPDATE MST_DenialReasons
			SET 
				 DenialReason		= @s_a_DenialReason,
				 modified_by_user	= @s_a_Created_By_User,
				 modified_date		= GETDATE()
			WHERE 
				 PK_Denial_ID = @i_a_Denial_ID
				

		   IF(@s_a_DenialReason<> @oldDenialReason)
			BEGIN
				UPDATE tblCASE
				SET DenialReasons_Type   = @s_a_DenialReason
				WHERE DenialReasons_Type = @oldDenialReason  
			END

	
			SET @s_l_message =  'Denial reason updated successfully'
			SET @i_l_result	 =  @i_a_Denial_ID
		END
		ELSE
		BEGIN
			SET @s_l_message =  'Denial reason already exist. You can not change the Denial reason '
			SET @i_l_result  =  @i_a_Denial_ID
		END
		
		
		SET @s_l_notes_desc = 'Updated Denial reason-'+	 @s_a_DenialReason	
            
		      EXEC F_AdminNotes_Add @s_a_notes_desc=@s_l_notes_desc,@s_a_User_Id = @s_a_Created_By_User,@s_a_notes_type='DenialReason' 
		                                         
		COMMIT TRAN			
	END
	SELECT @s_l_message AS [MESSAGE], @i_l_result AS [RESULT]	

END
GO
