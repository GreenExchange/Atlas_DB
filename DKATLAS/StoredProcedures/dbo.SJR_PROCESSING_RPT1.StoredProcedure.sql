USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[SJR_PROCESSING_RPT1]    Script Date: 6/17/2019 2:54:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SJR_PROCESSING_RPT1] @START_DATE DATETIME, @END_DATE DATETIME,@PROVIDER_NAME VARCHAR(50) =NULL
AS

BEGIN



/*declare @START_DATE DATETIME, @END_DATE DATETIME

set @start_date= '10/4/2010'
set @end_date = '10/8/2010'
*/
IF @PROVIDER_NAME IS NULL
BEGIN
  SELECT COUNT(CASE_ID) AS CASES,SUM(BALANCE) AS BALANCE , dbo.FUNC_Case_processor(Case_Id) AS User_Id, 
                      SUM(dbo.fnc_Case_Bill_Count(Case_Id)) AS Bills
FROM         dbo.VX_CASES
WHERE DATE_OPENED BETWEEN @START_DATE AND @END_DATE 
GROUP BY  dbo.FUNC_Case_processor(Case_Id)
GOTO FINISH
END


IF @PROVIDER_NAME IS NULL
BEGIN
  SELECT COUNT(CASE_ID) AS CASES,SUM(BALANCE) AS BALANCE , dbo.FUNC_Case_processor(Case_Id) AS User_Id, 
                      SUM(dbo.fnc_Case_Bill_Count(Case_Id)) AS Bills
FROM         dbo.VX_CASES
WHERE (DATE_OPENED BETWEEN @START_DATE AND @END_DATE) AND PROVIDER_NAME LIKE '%' +  @PROVIDER_NAME + '%'
GROUP BY  dbo.FUNC_Case_processor(Case_Id)
GOTO FINISH
END




FINISH:
END
GO
