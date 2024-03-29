USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[Get_Settlement_PivotReport]    Script Date: 6/17/2019 2:54:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_Settlement_PivotReport] --[Get_Settlement_PivotReport] 1
(
	@Type bit
)	
AS
BEGIN

	IF(@Type='1' ) -- Current settlement
	BEGIN
		SELECT 
			YEAR(date_opened) AS Date_Opened_Year,
			Case_Id,
			Insurancecompany_Name,
			Status, 
			CONVERT(MONEY,ISNULL(Claim_Amount,0)) aS Claim_Amount,
			CONVERT(MONEY,ISNULL(Paid_Amount,0)) AS Paid_Amount,
			CONVERT(MONEY,ISNULL(Balance_Amount,0)) As Balance_Amount,
			Settlement_PI,		
			Settlement_AF,			
			CONVERT(decimal(38, 2),CASE WHEN Balance_Amount < 1 THEN 0 ELSE (Settlement_PI/Balance_Amount) END )AS Settlement_PI_Per,
			CONVERT(decimal(38, 2),CASE WHEN Balance_Amount < 1 THEN 0 ELSE (Settlement_Af/Balance_Amount) END )AS Settlement_AF_Per,
			YEAR(Settlement_Date) AS Settlement_Year
		FROM lcj_vw_casesearchdetails b WHERE
		YEAR(date_opened) >= 2007 and YEAR(Settlement_Date) is not null
	END
	ELSE ---- Expected Settlement
	BEGIN
		SELECT YEAR(date_opened) AS Date_Opened_Year,Case_Id,Insurancecompany_Name,
		CONVERT(MONEY,ISNULL(Claim_Amount,0))AS Claim_Amount ,CONVERT(MONEY,ISNULL(Paid_Amount,0)) AS Paid_Amount ,Status, 
		Settlement_Amount + Settlement_Int AS  Settlement_PI,Settlement_AF,YEAR(Settlement_Date) AS Settlement_Year
		FROM lcj_vw_casesearchdetails b WHERE
		YEAR(date_opened) >= 2007 and YEAR(Settlement_Date) is null
	END
END
GO
