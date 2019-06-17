USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[GETINSURANCESPECIALITY_SETTLEMENTSUMMARY]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GETINSURANCESPECIALITY_SETTLEMENTSUMMARY] --'ACUPUNCTURE'
	@SZ_SPECIALITY NVARCHAR(100),
	@SZ_START_DATE NVARCHAR(50),
	@SZ_END_DATE NVARCHAR(50)
AS
BEGIN	
	SELECT
		CONVERT(DECIMAL(38,2),AVG(CONVERT(DECIMAL(38,2),ISNULL(TC.CLAIM_AMOUNT,0.00))-CONVERT(DECIMAL(38,2),ISNULL(TC.PAID_AMOUNT,0.00)))) AS OPEN_CLAIM,
		CONVERT(DECIMAL(38,2),AVG(CONVERT(DECIMAL(38,2),ISNULL(SETTLEMENT_AMOUNT,0.00))+CONVERT(DECIMAL(38,2),ISNULL(SETTLEMENT_INT,0.00)))) AS SETTLEMENT_AMOUNT,
		(CASE WHEN (AVG(CONVERT(DECIMAL(38,2),ISNULL(TC.CLAIM_AMOUNT,0.00))-CONVERT(DECIMAL(38,2),ISNULL(TC.PAID_AMOUNT,0.00)))) = 0.00
		THEN 0.00 ELSE CONVERT(DECIMAL(38,2),((AVG(CONVERT(DECIMAL(38,2),ISNULL(SETTLEMENT_AMOUNT,0.00))+CONVERT(DECIMAL(38,2),ISNULL(SETTLEMENT_INT,0.00))) /
		AVG(CONVERT(DECIMAL(38,2),ISNULL(TC.CLAIM_AMOUNT,0.00))-CONVERT(DECIMAL(38,2),ISNULL(TC.PAID_AMOUNT,0.00)))) * 100)) END) AS SETTLEMENT_PERC,
		AVG(DATEDIFF(DD,TC.DATE_OPENED,TS.SETTLEMENT_DATE)) AS AVG_DAYS_TO_SETTLE,
		SERVICE_TYPE
	FROM 
		TBLCASE TC INNER JOIN TBLTREATMENT TT
		ON TC.CASE_ID = TT.CASE_ID
		INNER JOIN TBLSETTLEMENTS TS
		ON TC.CASE_ID = TS.CASE_ID
	WHERE
		SERVICE_TYPE = @SZ_SPECIALITY
		and TC.case_id not like '%fh99%'
		AND
		CAST(FLOOR(CAST(DATE_OPENED AS FLOAT))AS DATETIME) >= REPLACE(@SZ_START_DATE,'/','-') 
		AND  
		CAST(FLOOR(CAST(DATE_OPENED AS FLOAT))AS DATETIME) <= REPLACE(@SZ_END_DATE,'/','-')
	GROUP BY
		SERVICE_TYPE
END

GO
