USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[BX_SERVICE_DETAILS2]    Script Date: 6/17/2019 2:53:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Name
-- ALTER date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[BX_SERVICE_DETAILS2] 
	@SERVICE_ID INT
AS
BEGIN
	
	SET NOCOUNT ON;

  SELECT     BX_SERVICES.ID, BX_SERVICES.CASE_ID, BX_SERVICES.DOS_START, BX_SERVICES.DOS_END, BX_SERVICES.AMOUNT, 
                      CASE WHEN BX_SERVICES.DATE_SENT = '1/1/1900' THEN 'UNKNOWN' ELSE CONVERT(VARCHAR(20),BX_SERVICES.DATE_SENT,101) END AS DATE_SENT, BX_SERVICES.STATUS, BX_SERVICES.PAY_STATUS, BX_SERVICES.LITIGATED, 
                      BX_SERVICE_STATUS.NAME AS STATUS_DESC, BX_PHYSICIANS.NAME AS PHYSICIAN_NAME, 
                      CASE WHEN BX_SERVICES.COMPLETE = 0 THEN DATEDIFF(D, dbo.BX_SERVICES.DOS_START, GETDATE()) END AS AGING, 
                      tblServiceType.ServiceType, BX_SERVICES.COMPLETE, ISNULL(BX_SERVICES.AMOUNT, 0) - ISNULL(SUM(BX_PAYMENTS.AMOUNT), 0) AS BALANCE, 
                      BX_SERVICES.MEMO, BX_CASE.CASE_ID_LONG, ISNULL(SUM(BX_PAYMENTS.AMOUNT), 0) AS PAYMENTS, BX_CASE.PROVIDER_FILENUMBER, 
                      tblInsuranceCompany.InsuranceCompany_Name, tblInsuranceCompany.BILLING_ADDRESS, tblInsuranceCompany.BILLING_CITY, 
                      tblInsuranceCompany.BILLING_STATE, tblInsuranceCompany.BILLING_ZIP, BX_SERVICES.PREP_FOR_LIT, BX_SERVICES.PREP_BY, 
                      BX_SERVICES.REFERENCE, BX_SERVICES.DENIAL_DATE, tblDenialReasons.DenialReasons_Type AS DENIAL_REASON, 
					  BX_CASE.PROVIDER,CASE WHEN BX_SERVICES.COMPLETE = 0 AND BX_SERVICES.VREQ1_RESP_DATE IS NULL THEN CONVERT(VARCHAR(20),DATEDIFF(D, ISNULL(dbo.BX_SERVICES.DATE_SENT, GETDATE()), GETDATE())) 
					  WHEN BX_SERVICES.COMPLETE = 0 AND BX_SERVICES.VREQ1_RESP_DATE IS NULL AND BX_SERVICES.DATE_SENT = '1/1/1900' THEN 'N/A'
					  WHEN  BX_SERVICES.DENIAL_DATE IS NOT NULL  THEN 'DENIED' WHEN (VREQ1_RESP_DATE IS NOT NULL AND 
                      VREQ2_RESP_DATE IS NULL AND BX_SERVICES.DENIAL_DATE IS NULL) THEN CONVERT(VARCHAR(20), DATEDIFF(D, 
                      ISNULL(dbo.BX_SERVICES.VREQ1_RESP_DATE, GETDATE()), GETDATE())) WHEN (VREQ2_RESP_DATE IS NOT NULL AND 
                      BX_SERVICES.DENIAL_DATE IS NULL) THEN CONVERT(VARCHAR(20), DATEDIFF(D, ISNULL(dbo.BX_SERVICES.VREQ2_RESP_DATE, GETDATE()), 
                      GETDATE()))  END AS DELAY,BX_SERVICES.FREEZED,BX_SERVICES.INVOICE_ID,BX_SERVICES.ARBITRATED,BX_SERVICES.BATCH_ID
FROM         BX_SERVICES INNER JOIN
                      BX_SERVICE_STATUS ON BX_SERVICES.STATUS = BX_SERVICE_STATUS.ID INNER JOIN
                      BX_PHYSICIANS ON BX_SERVICES.RENDERED_BY = BX_PHYSICIANS.ID INNER JOIN
                      tblServiceType ON BX_SERVICES.TYPE = tblServiceType.ServiceType_ID INNER JOIN
                      BX_CASE ON BX_SERVICES.CASE_ID = BX_CASE.CASE_ID INNER JOIN
                      tblInsuranceCompany ON BX_CASE.INSURANCE = tblInsuranceCompany.InsuranceCompany_Id LEFT OUTER JOIN
                      tblDenialReasons ON BX_SERVICES.DENIAL_REASON = tblDenialReasons.DenialReasons_Id LEFT OUTER JOIN
                      BX_PAYMENTS ON BX_SERVICES.ID = BX_PAYMENTS.SERVICE_ID
GROUP BY BX_SERVICES.ID, BX_SERVICES.CASE_ID, BX_SERVICES.DOS_START, BX_SERVICES.DOS_END, BX_SERVICES.AMOUNT, 
                      BX_SERVICES.DATE_SENT, BX_SERVICES.STATUS, BX_SERVICES.PAY_STATUS, BX_SERVICE_STATUS.NAME, BX_PHYSICIANS.NAME, 
                      BX_SERVICES.COMPLETE, DATEDIFF(D, BX_SERVICES.DOS_START, GETDATE()), BX_SERVICES.LITIGATED, tblServiceType.ServiceType, 
                      BX_SERVICES.MEMO, BX_CASE.CASE_ID_LONG, BX_CASE.PROVIDER_FILENUMBER, tblInsuranceCompany.InsuranceCompany_Name, 
                      tblInsuranceCompany.BILLING_ADDRESS, tblInsuranceCompany.BILLING_CITY, tblInsuranceCompany.BILLING_STATE, 
                      tblInsuranceCompany.BILLING_ZIP, BX_SERVICES.PREP_FOR_LIT, BX_SERVICES.PREP_BY, BX_SERVICES.REFERENCE, 
                      BX_SERVICES.DENIAL_DATE, tblDenialReasons.DenialReasons_Type, BX_CASE.PROVIDER,DATEDIFF(D, ISNULL(dbo.BX_SERVICES.DATE_SENT,GETDATE()), GETDATE()),BX_SERVICES.FREEZED,BX_SERVICES.INVOICE_ID,
					  BX_SERVICES.VREQ1_RESP_DATE,BX_SERVICES.VREQ2_RESP_DATE,BX_SERVICES.ARBITRATED,BX_SERVICES.BATCH_ID
HAVING      (BX_SERVICES.ID = @SERVICE_ID)
ORDER BY BX_SERVICES.DOS_START
END
GO
