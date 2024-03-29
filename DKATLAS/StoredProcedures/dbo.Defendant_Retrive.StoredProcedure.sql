USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[Defendant_Retrive]    Script Date: 6/17/2019 2:54:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Defendant_Retrive]
(
	@i_a_Defendant_Id		INT = 0

)
AS        
BEGIN  
    SELECT 
			Defendant_Id	
			, Defendant_Name
			, Defendant_DisplayName
			, Defendant_Address
			, Defendant_City
			, Defendant_State
			, Defendant_Zip
			, Defendant_Phone
			, Defendant_Fax
			, Defendant_Email	
			, ISNULL(active,'1') AS IsActive			
			, created_by_user	
			, CONVERT(VARCHAR(10), created_date, 101) AS created_date
			, modified_by_user	
			, CONVERT(VARCHAR(10), modified_date, 101) AS modified_date
	 FROM
		 tblDefendant  		
     WHERE 
	
		 (@i_a_Defendant_Id = 0 OR Defendant_Id = @i_a_Defendant_Id)
	 ORDER BY 
		 Defendant_Name 	
 

	
END
GO
