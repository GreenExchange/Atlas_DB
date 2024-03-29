USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_DDL_InsuranceCompanyGroupNames]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[LCJ_DDL_InsuranceCompanyGroupNames]  --[LCJ_DDL_InsuranceCompanyGroupNames] ''
(
	@DomaninId NVARCHAR(50)  
)
AS  
BEGIN
		SELECT   '0' AS InsuranceCompany_Id, ' ---Select Ins Group--- ' AS InsuranceCompany_GroupName   
		UNION  
		SELECT    InsuranceCompanyGroup_ID,	InsuranceCompanyGroup_Name	FROM tblInsuranceCompanyGroup
		WHERE DomainId = @DomaninId
		 order by InsuranceCompany_GroupName asc  
END


  
GO
