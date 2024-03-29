USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[BX_RPX_COVERLETTER]    Script Date: 6/17/2019 2:53:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		srosenthal
-- ALTER date: 1/27/09
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[BX_RPX_COVERLETTER] 
	
AS
BEGIN
	
	SET NOCOUNT ON;

    
	SELECT     BX_SERVICES.ID,BX_SERVICES.CASE_ID, CONVERT(VARCHAR(20),BX_SERVICES.DOS_START,101) + '- ' + CONVERT(VARCHAR(20),BX_SERVICES.DOS_END,101) AS DOS, BX_SERVICES.AMOUNT, tblProvider.Provider_Name, 
                      BX_CASE.PATIENT_LASTNAME + ',' + BX_CASE.PATIENT_FIRSTNAME AS PATIENT, BX_CASE.CLAIM_NUMBER, BX_CASE.CASE_ID_LONG, 
                      BX_CASE.PROVIDER_FILENUMBER, UPPER(tblInsuranceCompany.InsuranceCompany_Name) AS InsuranceCompany_Name , UPPER(tblInsuranceCompany.BILLING_ADDRESS) AS BILLING_ADDRESS, 
                      UPPER(tblInsuranceCompany.BILLING_CITY) AS BILLING_CITY, UPPER(tblInsuranceCompany.BILLING_STATE) AS BILLING_STATE, UPPER(tblInsuranceCompany.BILLING_ZIP) AS BILLING_ZIP, tblServiceType.ServiceType, 
                      tblServiceType.ServiceDesc,BX_SERVICES.REFERENCE
FROM         BX_CASE INNER JOIN
                      BX_SERVICES ON BX_CASE.CASE_ID = BX_SERVICES.CASE_ID INNER JOIN
                      tblInsuranceCompany ON BX_CASE.INSURANCE = tblInsuranceCompany.InsuranceCompany_Id INNER JOIN
                      tblServiceType ON BX_SERVICES.TYPE = tblServiceType.ServiceType_ID INNER JOIN
                      tblProvider ON BX_CASE.PROVIDER = tblProvider.Provider_Id


WHERE     (BX_SERVICES.DATE_SENT IS NULL) AND (BX_CASE.DELETED = 0)

ORDER BY BX_SERVICES.CASE_ID
END
GO
