USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_DDL_InsuranceCompanyNamesedit]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*Previously called LCJ_DDL_InsurerNames */
CREATE PROCEDURE [dbo].[LCJ_DDL_InsuranceCompanyNamesedit]
/*
	(
		@parameter1 datatype = default value,
		@parameter2 datatype OUTPUT
	)
*/
AS
SELECT    DISTINCT InsuranceCompany_Id, Upper(ISNULL(InsuranceCompany_Name, '')) AS InsuranceCompany_Name FROM tblInsuranceCompany WHERE     (1 = 1)  
 order by InsuranceCompany_Name asc
--and ActiveStatus <> 0
GO
