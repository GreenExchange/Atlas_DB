USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[IssueTracker_GetUserIDByName]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[IssueTracker_GetUserIDByName]
	@DomainId NVARCHAR(50),
	@UserName varchar(50)
AS
SELECT MAX(UserId) as UserId  from IssueTracker_Users 
WHERE  UserName = @UserName
and DomainId=@DomainId

GO
