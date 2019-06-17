USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[Adjuster_Retrive]    Script Date: 6/17/2019 2:53:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Adjuster_Retrive] -- [Adjuster_Retrive] 0,'localhost'
(
	@i_a_Adjuster_Id		INT = 0

)
AS        
BEGIN  
    SELECT 
			  Adjuster_Id	
			, Adjuster_LastName
			, Adjuster_FirstName
			, A.InsuranceCompany_Id
			, InsuranceCompany_Name
			, Adjuster_Address
			, Adjuster_Phone
			, Adjuster_Extension
			, Adjuster_Fax
			, Adjuster_Email	
			-- , ISNULL(active,'1') AS IsActive		
			, A.created_by_user	
			, CONVERT(VARCHAR(10), A.created_date, 101) AS created_date
			, modified_by_user	
			, CONVERT(VARCHAR(10), A.modified_date, 101) AS modified_date
	 FROM
		 tblAdjusters  A
	 LEFT OUTER JOIN tblInsuranceCompany I ON A.InsuranceCompany_Id =  I.InsuranceCompany_Id 
     WHERE 
	
		 (@i_a_Adjuster_Id = 0 OR Adjuster_Id = @i_a_Adjuster_Id)
	 ORDER BY 
		 Adjuster_LastName, Adjuster_FirstName 		
END
GO
