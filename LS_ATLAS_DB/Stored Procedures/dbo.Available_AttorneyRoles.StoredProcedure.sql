USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[Available_AttorneyRoles]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Available_AttorneyRoles]    
(
@DomainId varchar(50)
	) 
AS    
BEGIN  
   SELECT '0' as Id,' ---Select Attorney Role--- ' as RoleName
	UNION    
    select Id,RoleName from  [dbo].[tbl_AttorneyRoles] where DomainId=@DomainId
END
GO
