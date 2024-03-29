USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[GetCasesToDownloadDocuments]    Script Date: 6/17/2019 2:54:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[GetCasesToDownloadDocuments]
(
@LawFirmId LawFirmDetails READONLY
)
AS
BEGIN
		
		SELECT   c.Case_Id,c.GB_LawFirm_ID,'DK' AS domainid,t.BILL_NUMBER,GB_case_ID,GB_Company_id,GB_case_no ,t.DateOfService_Start
		FROM			tblcase c 
		INNER JOIN		tbltreatment t ON t.Case_Id = c.case_id
		INNER JOIN		@LawFirmId lfrm ON lfrm.LawFirmId = c.GB_LawFirm_ID
		WHERE  t.documentstatus = 'Document Pending' AND 
		c.GB_LawFirm_ID IN(SELECT LawFirmId FROM @LawFirmId)
		--AND t.BILL_NUMBER ='CD1745'
		--AND t.Bill_Number in (select BillNumber from XN_TEMP_GBB_ALL where Transferd_Date='2019-05-31')
		ORDER BY t.Case_Id,t.DateOfService_Start--and 	bill_number IN ('CD30417','WP1118')
		
	--select BillNumber from XN_TEMP_GBB_ALL where Transferd_Date='2019-05-31'
END








GO
