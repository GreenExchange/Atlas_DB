USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[BX_SP_FINANC_FREEZE]    Script Date: 6/17/2019 2:53:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		srosenthal
-- ALTER date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[BX_SP_FINANC_FREEZE]
@PROVIDER_ID INT	
AS
BEGIN
	
	SET NOCOUNT ON;

   UPDATE BX_PAYMENTS
SET FREEZED=1 , FREEZE_DATE =GETDATE(),FREEZE_BY = USER_NAME()
FROM         BX_PAYMENTS INNER JOIN
                      BX_PAYMENT_TYPE ON BX_PAYMENTS.TYPE = BX_PAYMENT_TYPE.ID INNER JOIN
                      BX_CASE INNER JOIN
                      BX_SERVICES ON BX_CASE.CASE_ID = BX_SERVICES.CASE_ID ON BX_PAYMENTS.SERVICE_ID = BX_SERVICES.ID INNER JOIN
                      tblProvider ON BX_CASE.PROVIDER = tblProvider.Provider_Id
WHERE     (BX_PAYMENT_TYPE.IS_FOR_INS = 1) AND (BX_PAYMENT_TYPE.PROVIDER_FEE = 0) AND (tblProvider.BX_SERV = 1) AND 
                      (BX_PAYMENTS.FREEZED = 0) AND (BX_CASE.DELETED = 0)AND (tblProvider.Provider_Id=@PROVIDER_ID)AND
					  (BX_PAYMENTS.INVOICE_ID IS NULL) 

UPDATE BX_SERVICES
SET FREEZED=1 , FREEZE_DATE =GETDATE(),FREEZE_BY = USER_NAME()
FROM             BX_CASE INNER JOIN
                      BX_SERVICES ON BX_CASE.CASE_ID = BX_SERVICES.CASE_ID  INNER JOIN
                      tblProvider ON BX_CASE.PROVIDER = tblProvider.Provider_Id
WHERE     (tblProvider.BX_SERV = 1) AND 
                      (BX_SERVICES.FREEZED = 0) AND (BX_CASE.DELETED = 0)AND (tblProvider.Provider_Id=@PROVIDER_ID)
					AND (BX_SERVICES.INVOICE_ID IS NULL)



END
GO
