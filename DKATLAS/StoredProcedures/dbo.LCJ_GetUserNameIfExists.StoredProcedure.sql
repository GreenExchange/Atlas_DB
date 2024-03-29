USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_GetUserNameIfExists]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[LCJ_GetUserNameIfExists]
(

@UserTypeLogin NVARCHAR(200),
@OperationResult INT OUTPUT

) 
AS

IF EXISTS(SELECT UserTypeLogin FROM IssueTracker_Users WHERE UserTypeLogin = @UserTypeLogin)

	BEGIN

		SELECT Username, RoleName, UserTypeLogin
		FROM 
			IssueTracker_Users
		LEFT OUTER JOIN
			IssueTracker_Roles
		ON
			IssueTracker_Users.RoleId = IssueTracker_Roles.RoleId
		
		Where UserTypeLogin = @UserTypeLogin

		
		SET @OperationResult = 1
		RETURN 1

	END

ELSE


	BEGIN
		
		SET @OperationResult = 0
		RETURN 0

	END
GO
