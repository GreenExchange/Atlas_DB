USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_Admin_GetAllUsers]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[LCJ_Admin_GetAllUsers] 
AS
SELECT '' AS DeskInfo, UserId, Username, DisplayName, RoleName,'' as DeleteUser
FROM 
	IssueTracker_Users
LEFT OUTER JOIN
	IssueTracker_Roles
ON
	IssueTracker_Users.RoleId = IssueTracker_Roles.RoleId
WHERE IssueTracker_Users.IsActive='True'
GO
