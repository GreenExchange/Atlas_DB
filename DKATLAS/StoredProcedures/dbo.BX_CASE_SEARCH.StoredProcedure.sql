USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[BX_CASE_SEARCH]    Script Date: 6/17/2019 2:53:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		srosenthal
-- ALTER date: 1/28/09
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[BX_CASE_SEARCH] 
@CASE_ID VARCHAR(50),@FILENUMBER VARCHAR(50),@PATIENT VARCHAR(50),@INSURED VARCHAR(50),@PROVIDER VARCHAR(200),
@FACILITY VARCHAR(50) ,@INSURANCE VARCHAR(200),@POLICY VARCHAR(50),@CLAIM VARCHAR(50),@DOA VARCHAR(50),
@RESULT VARCHAR(10)	,@TYPE VARCHAR(50)
	
AS
BEGIN
DECLARE @RESULT1 INT
	
	SET NOCOUNT ON;
SET @PROVIDER= REPLACE(REPLACE(@PROVIDER,'[','{'),']','}')

IF @RESULT='ALL'
	BEGIN

SELECT     BX_CASE.CASE_ID, BX_CASE.CASE_ID_LONG, tblProvider.Provider_Name + ISNULL(' [ ' + tblProvider.Provider_GroupName + ' ]', '') 
                      AS Provider_name, BX_CASE.PROVIDER, BX_CASE_TYPE.DESCRIPTION AS CASE_TYPE, 
                      BX_CASE.PATIENT_LASTNAME + ', ' + BX_CASE.PATIENT_FIRSTNAME AS PATIENT, BX_CASE.ACCIDENT_DATE, BX_CASE.PROVIDER_FILENUMBER, 
                      tblInsuranceCompany.InsuranceCompany_Name, COUNT(BX_SERVICES_VIEW.SERVICE_ID) AS BILLS, SUM(BX_SERVICES_VIEW.AMOUNT) 
                      AS AMOUNT, SUM(BX_SERVICES_VIEW.PAYMENTS) AS PAYMENTS, SUM(BX_SERVICES_VIEW.BALANCE) AS BALANCE, 
                      BX_CASE.CLAIM_NUMBER
FROM         tblProvider RIGHT OUTER JOIN
                      BX_CASE INNER JOIN
                      BX_CASE_TYPE ON BX_CASE.TYPE = BX_CASE_TYPE.ID LEFT OUTER JOIN
                      BX_SERVICES_VIEW ON BX_CASE.CASE_ID = BX_SERVICES_VIEW.CASE_ID LEFT OUTER JOIN
                      BX_FACILITY ON BX_CASE.FACILITY = BX_FACILITY.ID ON tblProvider.Provider_Id = BX_CASE.PROVIDER LEFT OUTER JOIN
                      tblInsuranceCompany ON BX_CASE.INSURANCE = tblInsuranceCompany.InsuranceCompany_Id                   
                      
                      

WHERE     (BX_CASE.CASE_ID_LONG LIKE '%' + ISNULL(@CASE_ID, '') + '%') AND (ISNULL(BX_CASE.PROVIDER_FILENUMBER, '') 
                      LIKE '%' + ISNULL(@FILENUMBER, '') + '%') AND (BX_CASE.PATIENT_LASTNAME + ', ' +  BX_CASE.PATIENT_FIRSTNAME LIKE '%' + ISNULL(@PATIENT, 
                      '') + '%') AND (BX_CASE.INSURED_FIRSTNAME + ' ' + BX_CASE.INSURED_LASTNAME LIKE '%' + ISNULL(@INSURED, '') + '%') AND 
                      (Provider_Name +Isnull(' { '+Provider_GroupName + ' }','') LIKE '%' + ISNULL(@PROVIDER, N'') + '%') AND 
                      (ISNULL(BX_FACILITY.SHORT_NAME, N'') LIKE '%' + ISNULL(@FACILITY, '') + '%') AND 
                      (tblInsuranceCompany.InsuranceCompany_Name LIKE '%' + ISNULL(@INSURANCE, '') + '%') AND (ISNULL(BX_CASE.POLICY_NUMBER, '') 
                      LIKE '%' + ISNULL(@POLICY, '') + '%') AND (ISNULL(BX_CASE.CLAIM_NUMBER, '') LIKE '%' + ISNULL(@CLAIM, '') + '%') AND (CONVERT(VARCHAR(20), 
                      BX_CASE.ACCIDENT_DATE, 101) LIKE '%' + ISNULL(@DOA, '') + '%') AND (BX_CASE_TYPE.DESCRIPTION LIKE '%' + ISNULL(@TYPE, '') + '%') AND BX_CASE.DELETED=0

GROUP BY BX_CASE.CASE_ID, BX_CASE.CASE_ID_LONG, tblProvider.Provider_Name + ISNULL(' [ ' + tblProvider.Provider_GroupName + ' ]', ''), 
                      BX_CASE.PROVIDER, BX_CASE_TYPE.DESCRIPTION, BX_CASE.PATIENT_LASTNAME + ', ' + BX_CASE.PATIENT_FIRSTNAME, 
                      BX_CASE.ACCIDENT_DATE, BX_CASE.PROVIDER_FILENUMBER, tblInsuranceCompany.InsuranceCompany_Name, BX_CASE.CLAIM_NUMBER

ORDER BY BX_CASE.CASE_ID DESC


PRINT @DOA

GOTO FINISH
	END

SET @RESULT1 = CONVERT(INT,@RESULT)

SELECT    TOP(@RESULT1) BX_CASE.CASE_ID, BX_CASE.CASE_ID_LONG, tblProvider.Provider_Name + ISNULL(' [ ' + tblProvider.Provider_GroupName + ' ]', '') 
                      AS Provider_name, BX_CASE.PROVIDER, BX_CASE_TYPE.DESCRIPTION AS CASE_TYPE, 
                      BX_CASE.PATIENT_LASTNAME + ', ' + BX_CASE.PATIENT_FIRSTNAME AS PATIENT, BX_CASE.ACCIDENT_DATE, BX_CASE.PROVIDER_FILENUMBER, 
                      tblInsuranceCompany.InsuranceCompany_Name, COUNT(BX_SERVICES_VIEW.SERVICE_ID) AS BILLS, SUM(BX_SERVICES_VIEW.AMOUNT) 
                      AS AMOUNT, SUM(BX_SERVICES_VIEW.PAYMENTS) AS PAYMENTS, SUM(BX_SERVICES_VIEW.BALANCE) AS BALANCE, 
                      BX_CASE.CLAIM_NUMBER
FROM         tblProvider RIGHT OUTER JOIN
                      BX_CASE INNER JOIN
                      BX_CASE_TYPE ON BX_CASE.TYPE = BX_CASE_TYPE.ID LEFT OUTER JOIN
                      BX_SERVICES_VIEW ON BX_CASE.CASE_ID = BX_SERVICES_VIEW.CASE_ID LEFT OUTER JOIN
                      BX_FACILITY ON BX_CASE.FACILITY = BX_FACILITY.ID ON tblProvider.Provider_Id = BX_CASE.PROVIDER LEFT OUTER JOIN
                      tblInsuranceCompany ON BX_CASE.INSURANCE = tblInsuranceCompany.InsuranceCompany_Id



WHERE     (BX_CASE.CASE_ID_LONG LIKE '%' + ISNULL(@CASE_ID, '') + '%') AND (ISNULL(BX_CASE.PROVIDER_FILENUMBER, '') 
                      LIKE '%' + ISNULL(@FILENUMBER, '') + '%') AND (BX_CASE.PATIENT_LASTNAME + ', ' +  BX_CASE.PATIENT_FIRSTNAME LIKE '%' + ISNULL(@PATIENT, 
                      '') + '%') AND (BX_CASE.INSURED_FIRSTNAME + ' ' + BX_CASE.INSURED_LASTNAME LIKE '%' + ISNULL(@INSURED, '') + '%') AND 
                      (tblProvider.Provider_Name +Isnull(' { '+ tblProvider.Provider_GroupName + ' }','') LIKE '%' + ISNULL(@PROVIDER, N'') + '%') AND 
                      (ISNULL(BX_FACILITY.SHORT_NAME, N'') LIKE '%' + ISNULL(@FACILITY, '') + '%') AND 
                      (tblInsuranceCompany.InsuranceCompany_Name LIKE '%' + ISNULL(@INSURANCE, '') + '%') AND (ISNULL(BX_CASE.POLICY_NUMBER, '') 
                      LIKE '%' + ISNULL(@POLICY, '') + '%') AND (ISNULL(BX_CASE.CLAIM_NUMBER, '') LIKE '%' + ISNULL(@CLAIM, '') + '%') AND (CONVERT(VARCHAR(20), 
                      BX_CASE.ACCIDENT_DATE, 101) LIKE '%' + ISNULL(@DOA, '') + '%') AND (BX_CASE_TYPE.DESCRIPTION LIKE '%' + ISNULL(@TYPE, '') + '%') AND BX_CASE.DELETED=0



GROUP BY BX_CASE.CASE_ID, BX_CASE.CASE_ID_LONG, tblProvider.Provider_Name + ISNULL(' [ ' + tblProvider.Provider_GroupName + ' ]', ''), 
                      BX_CASE.PROVIDER, BX_CASE_TYPE.DESCRIPTION, BX_CASE.PATIENT_LASTNAME + ', ' + BX_CASE.PATIENT_FIRSTNAME, 
                      BX_CASE.ACCIDENT_DATE, BX_CASE.PROVIDER_FILENUMBER, tblInsuranceCompany.InsuranceCompany_Name, BX_CASE.CLAIM_NUMBER

ORDER BY BX_CASE.CASE_ID DESC



FINISH:
 END
GO
