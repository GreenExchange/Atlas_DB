USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_DDL_InsuranceCompanyNames_ForHearings]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*Previously called LCJ_DDL_InsurerNames */

CREATE PROCEDURE [dbo].[LCJ_DDL_InsuranceCompanyNames_ForHearings]
/*
	(
		@parameter1 datatype = default value,
		@parameter2 datatype OUTPUT
	)
*/
AS
--ALTER TABLE #tmpInsuranceCompanyNames
--	(InsuranceCompany_Id nvarchar(100), InsuranceCompany_Name varchar(400))

begin
--insert into #tmpClientNames values(Null, Null)
--insert into #tmpInsuranceCompanyNames values('ALL','...ALL...')
---insert into #tmpInsuranceCompanyNames

	SELECT    DISTINCT InsuranceCompany_Id, Upper(ISNULL(InsuranceCompany_Name, '')) AS InsuranceCompany_Name
	FROM         tblInsuranceCompany
	WHERE     (1 = 1) and ActiveStatus <> 0 order by InsuranceCompany_Name

--select InsuranceCompany_Id, InsuranceCompany_Name from #tmpInsuranceCompanyNames order by 2
end

GO
