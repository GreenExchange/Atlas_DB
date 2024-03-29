USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[IssueTracker_User_GetAllUsers]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[IssueTracker_User_GetAllUsers] 
@DomainId NVARCHAR(50)
AS
SELECT UserId, Username, UserPassword, DisplayName, Email, RoleName, UserTypeLogin, UserType
FROM 
	IssueTracker_Users
LEFT OUTER JOIN
	IssueTracker_Roles
ON
	IssueTracker_Users.RoleId = IssueTracker_Roles.RoleId
	AND IssueTracker_Users.DomainId = IssueTracker_Roles.DomainId
WHERE IssueTracker_Users.DomainId=@DomainId

GO
