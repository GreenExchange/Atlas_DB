USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[IssueTracker_Role_GetAllRoles]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[IssueTracker_Role_GetAllRoles]
@DomainId NVARCHAR(50)
AS
SELECT RoleId, RoleName FROM IssueTracker_Roles WHERE DomainId=@DomainId

GO
