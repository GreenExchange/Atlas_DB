USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[InsuranceCompanyGroup_Retrive]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsuranceCompanyGroup_Retrive]
(
	@i_a_InsuranceCompanyGroup_ID INT = 0,
	@s_a_DomainID VARCHAR(50)
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

     WHERE 
		DomainId = @s_a_DomainID
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
		 and DomainID = @s_a_DomainID
	 ORDER BY 
		 InsuranceCompanyGroup_Name 
 END

END
GO
