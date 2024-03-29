USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[Selected_AttorneyNamesForFirm]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Selected_AttorneyNamesForFirm]    
(
@CaseId varchar(50),
@DomainId varchar(50)
	) 
AS    
BEGIN      
    select cam.AttorneyId,au.Name from  [dbo].[CaseAttorneyMapping] cam join [dbo].[tbl_AttorneyUser] au on cam.AttorneyId =au.UserId  where cam.CaseId=@CaseId and cam.DomainId=@DomainId
END
GO
