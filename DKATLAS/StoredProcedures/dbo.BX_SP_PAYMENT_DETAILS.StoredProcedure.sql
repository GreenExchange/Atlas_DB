USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[BX_SP_PAYMENT_DETAILS]    Script Date: 6/17/2019 2:53:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		srosenthal
-- ALTER date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[BX_SP_PAYMENT_DETAILS] 
	
	@SERVICE_ID int 
AS
BEGIN
	
	SET NOCOUNT ON;

    
	SELECT     BX_PAYMENTS.ID, BX_PAYMENTS.SERVICE_ID, BX_PAYMENTS.AMOUNT, BX_PAYMENTS.DATE, BX_PAYMENTS.FREEZED, 
                      BX_PAYMENTS.FREEZE_DATE, BX_PAYMENTS.INVOICE_ID, BX_PAYMENT_TYPE.PAYMENT_DESC
FROM         BX_PAYMENTS INNER JOIN
                      BX_PAYMENT_TYPE ON BX_PAYMENTS.TYPE = BX_PAYMENT_TYPE.ID
WHERE     (BX_PAYMENTS.SERVICE_ID = @SERVICE_ID)
ORDER BY BX_PAYMENTS.DATE
END
GO
