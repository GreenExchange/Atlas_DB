USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[IssueTracker_User_GetUserById]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[IssueTracker_User_GetUserById]
	@UserId Int
AS
SELECT 
	UserId, Username, UserPassword, Email, DisplayName, RoleName, UserTypeLogin, UserType
FROM 
	IssueTracker_Users
JOIN
	IssueTracker_Roles
ON 
	IssueTracker_Users.RoleId = IssueTracker_Roles.RoleId
WHERE 
	UserId = @UserId
GO
