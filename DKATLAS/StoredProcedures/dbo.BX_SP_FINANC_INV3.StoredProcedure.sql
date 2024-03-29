USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[BX_SP_FINANC_INV3]    Script Date: 6/17/2019 2:53:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		SROSENTHAL
-- ALTER date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[BX_SP_FINANC_INV3] 
	
	@INVOICE_ID INT 
AS
BEGIN
	
	SET NOCOUNT ON;

   
 SELECT     BX_SERVICES.ID AS SERVICE_ID, BX_SERVICES.CASE_ID, CONVERT(VARCHAR(20), BX_SERVICES.DOS_START, 101) 
                      + '  -  ' + CONVERT(VARCHAR(20), BX_SERVICES.DOS_END, 101) AS DOS, 
                      BX_CASE.PATIENT_FIRSTNAME + ' ' + BX_CASE.PATIENT_LASTNAME AS PATIENT, BX_CASE.CASE_ID_LONG, tblProvider.Provider_Id, 
                      BX_SERVICES.AMOUNT AS BILL_AMOUNT
FROM         tblProvider INNER JOIN
                      BX_CASE INNER JOIN
                      BX_SERVICES ON BX_CASE.CASE_ID = BX_SERVICES.CASE_ID ON tblProvider.Provider_Id = BX_CASE.PROVIDER
WHERE     (tblProvider.BX_SERV = 1) AND (BX_CASE.DELETED = 0) AND (BX_SERVICES.INVOICE_ID=@INVOICE_ID)
GROUP BY BX_SERVICES.ID, BX_SERVICES.CASE_ID, BX_CASE.CASE_ID_LONG, CONVERT(VARCHAR(20), BX_SERVICES.DOS_START, 101) 
                      + '  -  ' + CONVERT(VARCHAR(20), BX_SERVICES.DOS_END, 101), BX_CASE.PATIENT_FIRSTNAME + ' ' + BX_CASE.PATIENT_LASTNAME, 
                      tblProvider.Provider_Id, BX_SERVICES.AMOUNT



END
GO
