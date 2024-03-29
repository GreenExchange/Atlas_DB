USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_GetUserNameIfExists]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LCJ_GetUserNameIfExists]
(
@DomainId nvarchar(50),
@UserTypeLogin NVARCHAR(200),
@OperationResult INT OUTPUT

) 
AS

IF EXISTS(SELECT UserTypeLogin FROM IssueTracker_Users  WHERE UserTypeLogin = @UserTypeLogin and DomainId=@DomainId)

	BEGIN

		SELECT Username, RoleName, UserTypeLogin
		FROM 
			IssueTracker_Users  as IssueTracker_Users
		LEFT OUTER JOIN
			IssueTracker_Roles  as IssueTracker_Roles
		ON
			IssueTracker_Users.RoleId = IssueTracker_Roles.RoleId
			
		Where UserTypeLogin = @UserTypeLogin
		and IssueTracker_Users.DomainId = @DomainId

		
		SET @OperationResult = 1
		RETURN 1

	END

ELSE


	BEGIN
		
		SET @OperationResult = 0
		RETURN 0

	END

GO
