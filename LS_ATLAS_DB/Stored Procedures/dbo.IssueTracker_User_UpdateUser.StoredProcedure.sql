USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[IssueTracker_User_UpdateUser]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[IssueTracker_User_UpdateUser]
	@DomainId NVARCHAR(50),
	@UserId Int,
	@Username NVarChar(250),
	@RoleName NVarChar(100),
	@Email NVarChar(250),
	@DisplayName NVarChar(250),
	@UserPassword NVarChar(250) 
AS
IF EXISTS(SELECT UserId FROM IssueTracker_Users WHERE Username = @Username AND UserID <> @UserId and DomainId=@DomainId)
	RETURN 1

DECLARE @RoleId INT
SELECT @RoleId = RoleId FROM IssueTracker_Roles WHERE RoleName = @RoleName and DomainId=@DomainId
UPDATE IssueTracker_Users SET
	Username = @Username,
	RoleId = @RoleId,
	Email = @Email,
	DisplayName = @DisplayName,
	UserPassword = @UserPassword
	
WHERE 
	UserId = @UserId
	AND DomainId=@DomainId

GO
