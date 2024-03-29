USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[InsuranceCompanyGroup_Delete]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsuranceCompanyGroup_Delete]
(
		 @i_a_InsuranceCompanyGroup_ID			 INT,
		 @s_a_InsuranceCompanyGroup_Name		 VARCHAR(100),       
	     @s_a_Created_By_User					 VARCHAR(100) 
)
AS
BEGIN
	 DECLARE @s_l_message					NVARCHAR(500),
			 @s_l_notes_desc				NVARCHAR(500),
			 @InsuranceCompanyGroup_Name     VARCHAR(100) 
			
	 BEGIN
		IF EXISTS(SELECT InsuranceCompany_GroupName  FROM tblInsuranceCompany  WHERE InsuranceCompany_GroupName = @InsuranceCompanyGroup_Name)
	    BEGIN
	       SET @s_l_message	=  'Insurance Company Group exists in Insurance Company..!!!'
	    END
	    ELSE
	    BEGIN
			BEGIN TRAN
	        
	        DELETE FROM tblInsuranceCompanyGroup  WHERE InsuranceCompanyGroup_ID = @i_a_InsuranceCompanyGroup_ID 
	        
			SET @s_l_message= 'Insurance Company Group deleted'
			SET @s_l_notes_desc = 'Insurance Company Group deleted - ' + @s_a_InsuranceCompanyGroup_Name 
		    
		    EXEC F_AdminNotes_Add @s_a_notes_desc=@s_l_notes_desc,@s_a_user_Id=@s_a_Created_By_User,@s_a_notes_type='Insurance Company Group' 
		    
		    COMMIT TRAN 
		END	
		
		SELECT @s_l_message AS [MESSAGE]
		
	 END	
END
GO
