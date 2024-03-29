USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[SP_GET_AGE_NON_SETTLED_REPORT]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GET_AGE_NON_SETTLED_REPORT] --'869'
@PROVIDER_ID NVARCHAR(50)
AS
BEGIN

	DECLARE @AVG_AGE DECIMAL(10,2)
	DECLARE @COUNT INT

	CREATE TABLE #TEMP
	(
		[AVERAGE TURNAROUND TIME] DECIMAL(10,2),
		[NUMBER OF CASES] INT
	)

	INSERT INTO #TEMP
		EXEC SP_GET_AGE_REPORT @PROVIDER_ID

	SET @COUNT = (SELECT COUNT(CASE_ID) FROM TBLCASE WHERE PROVIDER_ID=@PROVIDER_ID AND STATUS<>'SETTLED' and  status not in ('CLOSED','Closed Arbitration','Closed as per RCF','Closed Judgement','Closed Withdrawn with Prejudice','Closed Withdrawn without prejudice','Settled','Withdrawn-with-prejudice','withdrawn-without-prejudice','Carrier In Rehab','Pending','Open-Old','Trial Lost'))
	IF @COUNT <> 0
	BEGIN
		SET @AVG_AGE = (((SELECT [AVERAGE TURNAROUND TIME] FROM #TEMP) * @COUNT) /
						(SELECT [NUMBER OF CASES] FROM #TEMP))
	END
	ELSE
	BEGIN
		SET @AVG_AGE = 0
	END

	DROP TABLE #TEMP
	SELECT @AVG_AGE AS AVG_AGE, @COUNT [REMAINING CASES] 

END

GO
