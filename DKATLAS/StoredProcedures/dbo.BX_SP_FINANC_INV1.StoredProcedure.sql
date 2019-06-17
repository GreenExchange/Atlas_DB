USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[BX_SP_FINANC_INV1]    Script Date: 6/17/2019 2:53:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		SROSENTHAL
-- ALTER date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[BX_SP_FINANC_INV1] 
	
	@INVOICE_ID INT 
AS
BEGIN
	
	SET NOCOUNT ON;

   /*SELECT     BX_PAYMENTS.INVOICE_ID, BX_SERVICES.ID AS SERVICE_ID, SUM(BX_PAYMENTS.AMOUNT)AS AMOUNT, COUNT(BX_PAYMENTS.ID)AS CHECKS,BX_SERVICES.CASE_ID, CONVERT(VARCHAR(20), 
                      BX_SERVICES.DOS_START, 101) + '  -  ' + CONVERT(VARCHAR(20), BX_SERVICES.DOS_END, 101) AS DOS, 
                      BX_CASE.PATIENT_FIRSTNAME + ' ' + BX_CASE.PATIENT_LASTNAME AS PATIENT, BX_CASE.CASE_ID_LONG, 
                      tblProvider.Provider_Id, BX_SERVICES.AMOUNT AS BILL_AMOUNT,SUM(BX_FEE_GRID.FEE) AS FEE
FROM         tblProvider INNER JOIN
                      BX_CASE INNER JOIN
                      BX_SERVICES ON BX_CASE.CASE_ID = BX_SERVICES.CASE_ID ON tblProvider.Provider_Id = BX_CASE.PROVIDER INNER JOIN
                      BX_FEE_GRID ON tblProvider.BX_FEE_SCHEDULE = BX_FEE_GRID.SCHEDULE_ID LEFT OUTER JOIN
                      BX_PAYMENTS INNER JOIN
                      BX_PAYMENT_TYPE ON BX_PAYMENTS.TYPE = BX_PAYMENT_TYPE.ID ON BX_SERVICES.ID = BX_PAYMENTS.SERVICE_ID

WHERE     (BX_PAYMENT_TYPE.IS_FOR_INS = 1 OR BX_PAYMENT_TYPE.IS_FOR_INS IS NULL) AND (BX_PAYMENT_TYPE.PROVIDER_FEE = 0 OR BX_PAYMENT_TYPE.PROVIDER_FEE IS NULL) AND (tblProvider.BX_SERV = 1) AND 
                      ((BX_PAYMENTS.FREEZED = 1)OR (BX_SERVICES.FREEZED=1)) AND (BX_CASE.DELETED = 0) AND (BX_PAYMENTS.INVOICE_ID = @invoice_ID AND /* OR */ BX_SERVICES.INVOICE_ID = @invoice_ID) AND 
                      ((BX_PAYMENTS.INVOICE_ID IS NOT NULL) OR (BX_SERVICES.INVOICE_ID IS NOT NULL)) AND (ISNULL(BX_PAYMENTS.AMOUNT,0) BETWEEN BX_FEE_GRID.RANGE_MIN AND BX_FEE_GRID.RANGE_MAX)
GROUP BY BX_SERVICES.ID, BX_SERVICES.CASE_ID, BX_CASE.CASE_ID_LONG, CONVERT(VARCHAR(20), BX_SERVICES.DOS_START, 101) 
                      + '  -  ' + CONVERT(VARCHAR(20), BX_SERVICES.DOS_END, 101), BX_CASE.PATIENT_FIRSTNAME + ' ' + BX_CASE.PATIENT_LASTNAME, 
                       tblProvider.Provider_Id, BX_PAYMENTS.INVOICE_ID, BX_SERVICES.AMOUNT */

 SELECT     BX_PAYMENTS.INVOICE_ID, BX_SERVICES.ID AS SERVICE_ID, SUM(BX_PAYMENTS.AMOUNT)AS AMOUNT, COUNT(BX_PAYMENTS.ID)AS CHECKS,BX_SERVICES.CASE_ID, CONVERT(VARCHAR(20), 
                      BX_SERVICES.DOS_START, 101) + '  -  ' + CONVERT(VARCHAR(20), BX_SERVICES.DOS_END, 101) AS DOS, 
                      BX_CASE.PATIENT_FIRSTNAME + ' ' + BX_CASE.PATIENT_LASTNAME AS PATIENT, BX_CASE.CASE_ID_LONG, 
                      tblProvider.Provider_Id, BX_SERVICES.AMOUNT AS BILL_AMOUNT,SUM(BX_FEE_GRID.FEE) AS FEE
FROM         tblProvider INNER JOIN
                      BX_CASE INNER JOIN
                      BX_SERVICES ON BX_CASE.CASE_ID = BX_SERVICES.CASE_ID ON tblProvider.Provider_Id = BX_CASE.PROVIDER INNER JOIN
                      BX_FEE_GRID ON tblProvider.BX_FEE_SCHEDULE = BX_FEE_GRID.SCHEDULE_ID LEFT OUTER JOIN
                      BX_PAYMENTS INNER JOIN
                      BX_PAYMENT_TYPE ON BX_PAYMENTS.TYPE = BX_PAYMENT_TYPE.ID ON BX_SERVICES.ID = BX_PAYMENTS.SERVICE_ID

WHERE     (BX_PAYMENT_TYPE.IS_FOR_INS = 1 ) AND (BX_PAYMENT_TYPE.APPLY_TO_INVOICE = 1) AND (BX_PAYMENT_TYPE.PROVIDER_FEE = 0 OR BX_PAYMENT_TYPE.PROVIDER_FEE IS NULL) AND (tblProvider.BX_SERV = 1) AND 
                      ((BX_PAYMENTS.FREEZED = 1)) AND (BX_CASE.DELETED = 0) AND (BX_PAYMENTS.INVOICE_ID = @invoice_ID ) AND 
                      ((BX_PAYMENTS.INVOICE_ID IS NOT NULL) ) AND (ISNULL(BX_PAYMENTS.AMOUNT,0) BETWEEN BX_FEE_GRID.RANGE_MIN AND BX_FEE_GRID.RANGE_MAX)
GROUP BY BX_SERVICES.ID, BX_SERVICES.CASE_ID, BX_CASE.CASE_ID_LONG, CONVERT(VARCHAR(20), BX_SERVICES.DOS_START, 101) 
                      + '  -  ' + CONVERT(VARCHAR(20), BX_SERVICES.DOS_END, 101), BX_CASE.PATIENT_FIRSTNAME + ' ' + BX_CASE.PATIENT_LASTNAME, 
                       tblProvider.Provider_Id, BX_PAYMENTS.INVOICE_ID, BX_SERVICES.AMOUNT



END
GO
