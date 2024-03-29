USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[BX_SP_ADD_PAYMENT]    Script Date: 6/17/2019 2:53:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		srosenthal
-- ALTER date: 1/21/2009
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[BX_SP_ADD_PAYMENT] 
	@service_id int,@amount money
	-- this stored procedure is not currently in use
AS
DECLARE @CASE_ID INT, @NOTES VARCHAR(50), @complete bit,@litigated bit
BEGIN
	
	SET NOCOUNT ON;
/*SELECT     @CASE_ID =BX_SERVICES.CASE_ID, @AMOUNT=BX_PAYMENTS.AMOUNT ,@complete=BX_SERVICES.COMPLETE,@LITIGATED=BX_SERVICES.LITIGATED
FROM         BX_SERVICES INNER JOIN
                      BX_PAYMENTS ON BX_SERVICES.ID = BX_PAYMENTS.SERVICE_ID
WHERE     (BX_PAYMENTS.SERVICE_ID = @SERVICE_ID) */

SELECT     @CASE_ID =CASE_ID, @complete=COMPLETE,@LITIGATED=LITIGATED
FROM         BX_SERVICES 
WHERE     (ID = @SERVICE_ID)

IF @COMPLETE=1 OR @LITIGATED=1 GOTO FINISH


   INSERT INTO BX_PAYMENTS (SERVICE_ID,AMOUNT)
VALUES (@SERVICE_ID,@AMOUNT)

SET @NOTES='PAYMENT RECEIVED :$'+ CONVERT(VARCHAR(20),@AMOUNT)
EXEC BX_SP_ADD_NOTES @CASE_ID=@CASE_ID,@DESC=@NOTES,@TYPE= 'PAYMENT',@PRIORITY=0

FINISH:
END
GO
