USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[InsuranceCompanyGroup_Retrive]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsuranceCompanyGroup_Retrive]
(
	@i_a_InsuranceCompanyGroup_ID INT = 0
	
)
AS        
BEGIN  

 IF(@i_a_InsuranceCompanyGroup_ID = 0)
 BEGIN
    SELECT 
		  InsuranceCompanyGroup_ID	
		, InsuranceCompanyGroup_Name	
		, created_by_user	
		, CONVERT(VARCHAR(10), created_date, 101) AS created_date
		, modified_by_user	
		, CONVERT(VARCHAR(10), modified_date, 101) AS modified_date
	 FROM
		 tblInsuranceCompanyGroup	

    
	 ORDER BY 
		 InsuranceCompanyGroup_Name 	
 END
ELSE
 BEGIN
	SELECT 
		InsuranceCompanyGroup_ID
		, InsuranceCompanyGroup_Name	
		, created_by_user	
		, CONVERT(VARCHAR(10), created_date, 101) AS created_date
		, modified_by_user	
		, CONVERT(VARCHAR(10), modified_date, 101) AS modified_date
	 FROM
		  tblInsuranceCompanyGroup			
	 WHERE
		 InsuranceCompanyGroup_ID = @i_a_InsuranceCompanyGroup_ID
		
	 ORDER BY 
		 InsuranceCompanyGroup_Name 
 END

END
GO
