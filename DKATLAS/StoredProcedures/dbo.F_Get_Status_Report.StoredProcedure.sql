USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[F_Get_Status_Report]    Script Date: 6/17/2019 2:54:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[F_Get_Status_Report]   --     [F_Get_Status_Report]
--(
--	@dt_Start DATETIME,
--	@dt_End DATETIME
--)
AS  
	BEGIN
	
			--SELECT Status,COUNT(*) AS Count FROM tblcase
			--INNER JOIN tblStatus ON TBLSTATUS.Status_Type=TBLCASE.Status
			--WHERE Status in ('AAA ASSOCIATION INTERNAL REVIEW','AAA FILE INCOMPLETE SCAN','AAA FILED','AAA OPEN',
			--'AAA PACKAGE PRINTED','AAA PACKAGE PRINTED AWAITING RE-PRINT','AAA PACKAGE READY TO FILE',
			--'AAA PACKAGE READY TO PRINT','AAA PACKAGE READY TO SUBMIT','AAA PACKAGE-REJECTED','AAA PENDING',
			--'AAA PENDING / HOLD','AAA SCANS RECEIVED','AAA CONFIRMED','AAA HEARING SET','AAA LOST','AAA OPEN/SCANNED','AAA PENDING HOLD-CIVIL RECO',
			--'GBB')
			--GROUP BY Status,tblStatus.hierarchy_Id,tblStatus.forum
			--ORDER BY tblStatus.hierarchy_Id ,tblStatus.forum ASC

	SELECT Status,COUNT(*) AS Count FROM tblcase
			INNER JOIN tblStatus ON TBLSTATUS.Status_Type=TBLCASE.Status
			WHERE Initial_Status = 'ARB' -- and IndexOrAAA_Number is null  
			GROUP BY Status,tblStatus.hierarchy_Id,tblStatus.forum
			ORDER BY Status--tblStatus.hierarchy_Id ,tblStatus.forum ASC
			
			
			
			
				SELECT Status,COUNT(*) AS Count FROM tblcase
			INNER JOIN tblStatus ON TBLSTATUS.Status_Type=TBLCASE.Status
			WHERE Initial_Status = 'LIT' --and IndexOrAAA_Number is null  
			GROUP BY Status,tblStatus.hierarchy_Id,tblStatus.forum
			ORDER BY tblStatus.hierarchy_Id ,tblStatus.forum ASC

	SELECT distinct status_type as Status, count(case_id) AS Count ,tblStatus.hierarchy_Id,tblStatus.forum FROM TBLSTATUS
	LEFT OUTER JOIN tblcase ON tblcase.status = TBLSTATUS.Status_Type
	GROUP BY TBLSTATUS.Status_Type,tblStatus.hierarchy_Id,tblStatus.forum
	ORDER BY tblStatus.hierarchy_Id ,tblStatus.forum ASC

	
	
END
GO
