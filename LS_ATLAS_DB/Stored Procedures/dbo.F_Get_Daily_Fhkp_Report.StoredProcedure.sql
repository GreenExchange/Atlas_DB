USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[F_Get_Daily_Fhkp_Report]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[F_Get_Daily_Fhkp_Report]   --[dbo].[F_Get_Daily_Fhkp_Report]      

AS  
	BEGIN
	-----AAA STATUS SHEET-----
	SELECT Status,COUNT(*) AS Count FROM tblcase 
	WHERE Status in ('AAA CONFIRMED','AAA FILE INCOMPLETE SCAN','AAA FILED','AAA HEARING SET','AAA LOST','AAA OPEN','AAA PACKAGE PRINTED',
	'AAA PACKAGE PRINTED AWAITING RE-PRINT','AAA PACKAGE READY TO PRINT','AAA PACKAGE READY TO SUBMIT','AAA PACKAGE-REJECTED','AAA PENDING','AAA PENDING / HOLD',
	'AAA PENDING HOLD-CIVIL RECO','AAA PENDING- RESOLVED','AAA PACKAGE READY','AAA SCANS READY TO SUBMIT','AAA OPEN/SCANNED','GBB')GROUP BY Status
	
	-----STATUS BREAKDOWN------
	SELECT case_id, 
	CONVERT(varchar,date_opened,101) date_opened,
	DATEDIFF(dd,date_opened,GETDATE()) [DATEDIF_OPENED],	
	status,	
	Old_Status,
	CONVERT(varchar,date_status_changed,101) as date_status_changed,
	DATEDIFF(dd,date_status_changed,GETDATE()) as [DATEDIFF_Status_Changed]
	FROM tblcase 
	WHERE Status ='AAA OPEN/SCANNED'
	
	------JENN BROWN HOSP------
	SELECT provider_name,provider_groupname,
	status,count(*)AS COUNT
	FROM LCJ_VW_CaseSearchDetails
	WHERE Provider_GroupName
	LIKE '%Jenn%'
	GROUP BY
	provider_name,provider_groupname,
	status
	
	END

GO
