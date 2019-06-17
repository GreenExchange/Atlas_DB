USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[SP_EXCLUSION_GET_AGE_REPORT]    Script Date: 6/17/2019 2:54:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_EXCLUSION_GET_AGE_REPORT] --85
@PROVIDER_ID NVARCHAR(50)
AS
BEGIN

	DECLARE @DT_SETTLEMENT DATETIME
	DECLARE @DT_OPENED DATETIME
	DECLARE @I_CASE_AGE DECIMAL(10,2)
	DECLARE @COUNT INT
	DECLARE @AGE INT
	DECLARE @CASE_ID NVARCHAR(50)
	DECLARE CASE_CURSOR CURSOR
	FOR
	SELECT CASE_ID FROM TBLCASE WHERE PROVIDER_ID = @PROVIDER_ID AND STATUS='SETTLED'
	OPEN CASE_CURSOR
	FETCH NEXT FROM CASE_CURSOR INTO @CASE_ID
	SET @I_CASE_AGE = 0
	SET @COUNT = 0
	WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @DT_SETTLEMENT = (SELECT TOP 1 SETTLEMENT_DATE FROM TBLSETTLEMENTS WHERE CASE_ID = @CASE_ID)
		SET @DT_OPENED = (SELECT DATE_OPENED FROM TBLCASE WHERE CASE_ID = @CASE_ID)
		
		IF(@DT_SETTLEMENT IS NULL)
		BEGIN
			SET @AGE = DATEDIFF(DAY,@DT_OPENED,GETDATE())
		END
		ELSE
		BEGIN
			SET @AGE = DATEDIFF(DAY,@DT_OPENED,@DT_SETTLEMENT)
		END
		SET @COUNT = @COUNT + 1
		SET @I_CASE_AGE = @I_CASE_AGE + @AGE
		FETCH NEXT FROM CASE_CURSOR INTO @CASE_ID
--		print(convert(nvarchar(20),@I_CASE_AGE))
--		PRINT(@COUNT)
	END
	CLOSE CASE_CURSOR
	DEALLOCATE CASE_CURSOR
	IF @COUNT <> 0
	BEGIN
		SET @I_CASE_AGE = @I_CASE_AGE / @COUNT
	END
	ELSE
	BEGIN
		SET @I_CASE_AGE = 0
	END
	

--	PRINT(@I_CASE_AGE)

	SELECT @I_CASE_AGE AS [AVERAGE TURNAROUND TIME],@COUNT AS [NUMBER OF CASES]
END
GO
