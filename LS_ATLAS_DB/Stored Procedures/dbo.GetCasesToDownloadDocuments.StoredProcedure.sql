USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[GetCasesToDownloadDocuments]    Script Date: 6/17/2019 2:29:45 AM ******/
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
      
  SELECT c.Case_Id,c.GB_LawFirm_ID,c.domainid,t.BILL_NUMBER,GB_case_ID,GB_Company_id,GB_case_no ,t.DateOfService_Start    
  FROM   tblcase c     
  INNER JOIN  tbltreatment t ON t.Case_Id = c.case_id    
  INNER JOIN  @LawFirmId lfrm ON lfrm.LawFirmId = c.GB_LawFirm_ID    
  WHERE t.documentstatus = 'Document Pending' --AND c.GB_LawFirm_ID IN(SELECT LawFirmId FROM @LawFirmId)    
--  AND T.Case_Id in ('ACT-AF-186984',
--'ACT-AF-185180') 
   --AND t.DomainId = 'mcm'    
  --AND t.Bill_number in (select [Bill #] from [dbo].[XN_AF_RESub] )    
  ORDER BY t.Case_Id,t.DateOfService_Start    
     
END    
    
    
    
    
    
    
GO
