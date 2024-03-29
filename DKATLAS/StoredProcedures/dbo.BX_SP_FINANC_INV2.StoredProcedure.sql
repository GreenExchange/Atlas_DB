USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[BX_SP_FINANC_INV2]    Script Date: 6/17/2019 2:53:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		SROSENTHAL
-- ALTER date: 2/10/2009
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[BX_SP_FINANC_INV2] 
	
	@INVOICE_ID INT 
AS
BEGIN
	
	SET NOCOUNT ON;

   /*SELECT     tblProvider.Provider_Id, tblProvider.Provider_Name, SUM(BX_PAYMENTS.AMOUNT) AS AMOUNT, COUNT(DISTINCT BX_PAYMENTS.ID) 
                      AS PAYMENT_COUNT, COUNT(DISTINCT BX_PAYMENTS.SERVICE_ID) AS BILL_COUNT, ISNULL(tblProvider.BX_FEE, 0) AS BX_FEE, 
                      ISNULL(tblProvider.BX_SHR_FEE, 0) AS BX_SHR_FEE, ISNULL(tblProvider.BX_FEE, 0) * SUM(BX_PAYMENTS.AMOUNT) AS BX_AMOUNT, 
                      SUM(BX_PAYMENTS.AMOUNT) * ISNULL(tblProvider.BX_SHR_FEE, 0) AS BX_SHR_AMOUNT, SUM(BX_PAYMENTS.AMOUNT) 
                      * (1 - ISNULL(tblProvider.BX_FEE, 0) - ISNULL(tblProvider.BX_SHR_FEE, 0)) AS BX_PROVIDER_AMOUNT, 
                      COUNT(DISTINCT BX_PAYMENTS.SERVICE_ID) * tblProvider.BX_PSTG AS POSTAGE_FEE, tblProvider.Provider_Local_Address, 
                      tblProvider.Provider_Local_City, tblProvider.Provider_Local_State, tblProvider.Provider_Local_Zip
FROM         BX_PAYMENTS INNER JOIN
                      BX_PAYMENT_TYPE ON BX_PAYMENTS.TYPE = BX_PAYMENT_TYPE.ID INNER JOIN
                      BX_CASE INNER JOIN
                      BX_SERVICES ON BX_CASE.CASE_ID = BX_SERVICES.CASE_ID ON BX_PAYMENTS.SERVICE_ID = BX_SERVICES.ID INNER JOIN
                      tblProvider ON BX_CASE.PROVIDER = tblProvider.Provider_Id
WHERE     (BX_PAYMENT_TYPE.IS_FOR_INS = 1) AND (BX_PAYMENT_TYPE.PROVIDER_FEE = 0) AND (tblProvider.BX_SERV = 1) AND 
                      (BX_PAYMENTS.FREEZED = 1) AND (BX_PAYMENTS.INVOICE_ID = @INVOICE_ID)
GROUP BY tblProvider.Provider_Id, tblProvider.Provider_Name, ISNULL(tblProvider.BX_FEE, 0), ISNULL(tblProvider.BX_SHR_FEE, 0), tblProvider.BX_PSTG, 
                      tblProvider.Provider_Local_Address, tblProvider.Provider_Local_City, tblProvider.Provider_Local_State, tblProvider.Provider_Local_Zip */

SELECT     tblProvider.Provider_Name, tblProvider.Provider_Id, BX_INVOICES.DATE, BX_INVOICES.AMOUNT, BX_INVOICES.TR_COUNT, 
                      BX_INVOICES.BILL_COUNT, BX_INVOICES.SCHEDULE_ID, BX_INVOICES.PAYMENTS, BX_INVOICES.FEES, BX_FEE_GRID.DESCRIPTION, 
                      BX_INVOICES.ID AS INVOICE_ID, tblProvider.Provider_Local_Address, 
                      tblProvider.Provider_Local_City, tblProvider.Provider_Local_State, tblProvider.Provider_Local_Zip
FROM         BX_INVOICES INNER JOIN
                      tblProvider ON BX_INVOICES.PROVIDER_ID = tblProvider.Provider_Id INNER JOIN
                      BX_FEE_GRID ON BX_INVOICES.SCHEDULE_ID = BX_FEE_GRID.SCHEDULE_ID
WHERE     (BX_INVOICES.ID = @INVOICE_ID)
GROUP BY tblProvider.Provider_Name, tblProvider.Provider_Id, BX_INVOICES.DATE, BX_INVOICES.AMOUNT, BX_INVOICES.TR_COUNT, 
                      BX_INVOICES.BILL_COUNT, BX_INVOICES.SCHEDULE_ID, BX_INVOICES.PAYMENTS, BX_INVOICES.FEES, BX_FEE_GRID.DESCRIPTION, 
                      BX_INVOICES.ID, tblProvider.Provider_Local_Address, tblProvider.Provider_Local_City, tblProvider.Provider_Local_State, tblProvider.Provider_Local_Zip

END
GO
