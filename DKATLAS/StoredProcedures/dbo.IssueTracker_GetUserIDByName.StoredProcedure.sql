USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[IssueTracker_GetUserIDByName]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[IssueTracker_GetUserIDByName]
	@UserName varchar(50)
AS
SELECT MAX(UserId) as UserId  from IssueTracker_Users 
WHERE  UserName = @UserName
GO
