USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[F_DDL_InsuranceCompany]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[F_DDL_InsuranceCompany]--[F_DDL_InsuranceCompany] 'GLF'
(
	@DomainID VARCHAR(50)
)	
AS
BEGIN

	SET NOCOUNT ON;
	
	SELECT '0' AS InsuranceCompany_Id,' ---SELECT Insurance Company--- ' AS InsuranceCompany_Name
	UNION
	SELECT InsuranceCompany_Id,InsuranceCompany_Name +'[' + ISNULL(InsuranceCompany_Local_Address,'') + ' ' +ISNULL(InsuranceCompany_Local_City,'')+ ' ' +ISNULL(InsuranceCompany_Local_State,'') +']' + Isnull('    [ '+InsuranceCompany_GroupName + ' ]','') AS InsuranceCompany_Name
	FROM tblInsuranceCompany WHERE InsuranceCompany_Id <> 0 and ActiveStatus = 1 
	AND DomainID = @DomainID ORDER BY InsuranceCompany_Name
	
	SET NOCOUNT OFF ;



END

GO
