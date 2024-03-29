USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[IssueTracker_User_GetAllUsersByRoleName]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[IssueTracker_User_GetAllUsersByRoleName]
	@RoleName NVarChar(50) 
AS
DECLARE @RoleLevel Int

SELECT @RoleLevel = RoleLevel FROM IssueTracker_Roles WHERE RoleName = @RoleName

SELECT 
	IssueTracker_Users.* 
FROM 
	IssueTracker_Users
	INNER JOIN IssueTracker_Roles ON IssueTracker_Users.RoleId = IssueTracker_Roles.RoleId
WHERE
	RoleLevel <= @RoleLevel
GO
