USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[F_DDL_ECMC_InsuranceCompany]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[F_DDL_ECMC_InsuranceCompany]  
	
AS
BEGIN

	SET NOCOUNT ON;
	
	SELECT ' ---SELECT Insurance Company--- ' AS Insurance
	UNION
	SELECT DISTINCT Insurance  FROM ECMC WHERE Insurance not like '%SELECT%'
	UNION
	SELECT Distinct InsuranceCompany_Name from tblinsurancecompany
	
	SET NOCOUNT OFF ;



END

GO
