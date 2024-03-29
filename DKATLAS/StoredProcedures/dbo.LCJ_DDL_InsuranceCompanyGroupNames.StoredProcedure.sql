USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_DDL_InsuranceCompanyGroupNames]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*Previously called LCJ_DDL_InsurerNames */
CREATE PROCEDURE [dbo].[LCJ_DDL_InsuranceCompanyGroupNames]
/*
	(
		@parameter1 datatype = default value,
		@parameter2 datatype OUTPUT
	)
*/
AS
SELECT   '' AS InsuranceCompany_Id, '' AS InsuranceCompany_GroupName 
UNION
SELECT    DISTINCT InsuranceCompany_Id, Upper(ISNULL(InsuranceCompany_GroupName, '')) AS InsuranceCompany_GroupName FROM tblInsuranceCompany WHERE     (1 = 1)  and active = 2 and ActiveStatus <> 0 and InsuranceCompany_GroupName <>'' order by InsuranceCompany_GroupName asc
GO
