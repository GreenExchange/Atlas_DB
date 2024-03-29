USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[BX_CASE_DETAILS]    Script Date: 6/17/2019 2:53:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Name
-- ALTER date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[BX_CASE_DETAILS] 
	@case_id int
AS
BEGIN
	
	SET NOCOUNT ON;

  SELECT     BX_CASE.CASE_ID, BX_CASE.PATIENT_FIRSTNAME, BX_CASE.PATIENT_LASTNAME, BX_CASE.INSURED_FIRSTNAME, 
                      BX_CASE.PATIENT_LASTNAME + ', ' + BX_CASE.PATIENT_FIRSTNAME AS FULL_NAME, BX_CASE.INSURED_LASTNAME, BX_CASE.POLICY_NUMBER, 
                      BX_CASE.CLAIM_NUMBER, BX_CASE.ACCIDENT_DATE, BX_CASE.MEMO, BX_CASE.CASE_ID_LONG, 
                      tblInsuranceCompany.InsuranceCompany_Name, tblProvider.Provider_Name + ISNULL('    [ ' + tblProvider.Provider_GroupName + ' ]', '') 
                      AS Provider_Name, BX_FACILITY.SHORT_NAME AS FACILITY_SHORT_NAME, CASE WHEN BX_FACILITY.ADDRESS IS NULL 
                      THEN TBLPROVIDER.PROVIDER_LOCAL_ADDRESS END AS FACILITY_ADDRESS, CASE WHEN BX_FACILITY.CITY IS NULL 
                      THEN TBLPROVIDER.PROVIDER_LOCAL_CITY END AS FACILITY_CITY, CASE WHEN BX_FACILITY.STATE IS NULL 
                      THEN TBLPROVIDER.PROVIDER_LOCAL_STATE END AS FACILITY_STATE, CASE WHEN BX_FACILITY.ZIP IS NULL 
                      THEN TBLPROVIDER.PROVIDER_LOCAL_ZIP END AS FACILITY_ZIP, tblInsuranceCompany.BILLING_ADDRESS, tblInsuranceCompany.BILLING_CITY, 
                      tblInsuranceCompany.BILLING_STATE, tblInsuranceCompany.BILLING_ZIP, BX_CASE.PROVIDER_FILENUMBER, BX_CASE.PROVIDER, 
                      tblProvider.Provider_Local_Phone, tblProvider.Provider_Local_Fax, tblInsuranceCompany.InsuranceCompany_Id, 
                      BX_CASE_TYPE.DESCRIPTION AS CASE_TYPE
FROM         tblProvider INNER JOIN
                      BX_CASE ON tblProvider.Provider_Id = BX_CASE.PROVIDER INNER JOIN
                      tblInsuranceCompany ON BX_CASE.INSURANCE = tblInsuranceCompany.InsuranceCompany_Id INNER JOIN
                      BX_CASE_TYPE ON BX_CASE.TYPE = BX_CASE_TYPE.ID LEFT OUTER JOIN
                      BX_FACILITY ON tblProvider.Provider_Id = BX_FACILITY.PROVIDER
WHERE     (BX_CASE.CASE_ID = @case_id)
END
GO
