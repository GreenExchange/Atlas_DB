USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[IssueTracker_User_CreateNewUser]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[IssueTracker_User_CreateNewUser]
	@Username NVarChar(250),
	@RoleName NVarChar(100),
	@Email NVarChar(250),
	@DisplayName NVarChar(250),
	@UserPassword NVarChar(250),
	@UserTypeLogin	NVarChar(100),
	@UserType	NVarChar(10)
AS
IF EXISTS(SELECT UserId FROM IssueTracker_Users WHERE Username = @Username)
	RETURN 0

DECLARE @RoleId INT
SELECT @RoleId = RoleId FROM IssueTracker_Roles WHERE RoleName = @RoleName
INSERT IssueTracker_Users
(
	Username,
	RoleId,
	Email,
	DisplayName,
	UserPassword,
	UserTypeLogin,
	UserType
) 
VALUES 
(
	@Username,
	@RoleId,
	@Email,
	@DisplayName,
	@UserPassword,
	@UserTypeLogin,
	@UserType
)

RETURN @@IDENTITY
GO
