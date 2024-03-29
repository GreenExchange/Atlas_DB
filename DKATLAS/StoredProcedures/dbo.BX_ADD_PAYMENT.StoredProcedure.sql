USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[BX_ADD_PAYMENT]    Script Date: 6/17/2019 2:53:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		srosenthal
-- ALTER date: 1/21/2009
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[BX_ADD_PAYMENT] 
	@service_id int,@amount money,@type smallint
	
AS
BEGIN

DECLARE @CASE_ID INT, @NOTES VARCHAR(50), @BALANCE MONEY
	SET NOCOUNT ON;

   INSERT INTO BX_PAYMENTS (SERVICE_ID,AMOUNT,type)
VALUES (@SERVICE_ID,@AMOUNT,@type)

SELECT @CASE_ID=CASE_ID FROM BX_SERVICES WHERE ID=@SERVICE_ID

SET @NOTES='VOLUNTARY PAYMENT POSTED :$'+ CONVERT(VARCHAR(20),@AMOUNT)
EXEC BX_SP_ADD_NOTES @CASE_ID=@CASE_ID,@DESC=@NOTES,@TYPE= 'PAYMENT',@PRIORITY=0

SELECT     @BALANCE =ISNULL(BX_SERVICES.AMOUNT, 0) 
                      - ISNULL(SUM(BX_PAYMENTS.AMOUNT), 0)
FROM         BX_PAYMENTS INNER JOIN
                      BX_SERVICES ON BX_PAYMENTS.SERVICE_ID = BX_SERVICES.ID
WHERE BX_SERVICES.ID=@SERVICE_ID
GROUP BY BX_SERVICES.AMOUNT


IF @BALANCE<=0 
	BEGIN 
		exec BX_SP_COMPLETE_SERVICE @service_id =@service_id
		GOTO FINISH
	END

EXEC BX_SP_UPDATE_SERVICE_STATUS @SERVICE_ID =@SERVICE_ID ,@NEW_STATUS=5

		
FINISH:
END
GO
