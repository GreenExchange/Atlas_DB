USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[IssueTracker_Role_GetAllRoles]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[IssueTracker_Role_GetAllRoles]
AS
SELECT RoleId, RoleName FROM IssueTracker_Roles
GO
