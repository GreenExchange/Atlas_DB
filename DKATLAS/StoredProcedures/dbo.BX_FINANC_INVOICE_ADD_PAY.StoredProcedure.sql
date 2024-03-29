USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[BX_FINANC_INVOICE_ADD_PAY]    Script Date: 6/17/2019 2:53:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		SROSENTHAL
-- ALTER date: 4/29/2009
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[BX_FINANC_INVOICE_ADD_PAY] 
	
	@INVOICE_ID int  , 
	@AMOUNT MONEY ,@DESC VARCHAR(200)
AS
BEGIN
	
	SET NOCOUNT ON;

	INSERT INTO BX_TRANSACTIONS (TR_AMOUNT,TR_DATE,TR_DESC,INVOICE_ID,TR_TYPE)
	VALUES (@AMOUNT,GETDATE(),@DESC,@INVOICE_ID,1)
END
GO
