USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[Available_AttorneyFirm]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Available_AttorneyFirm]    
(
@DomainId varchar(50)
	) 
AS    
BEGIN  
    SELECT '0' as Id,' ---Select Attorney Firm--- ' as Name
	UNION
    select Id,Name from  [dbo].[tbl_AttorneyFirm] where DomainId=@DomainId
END
GO
