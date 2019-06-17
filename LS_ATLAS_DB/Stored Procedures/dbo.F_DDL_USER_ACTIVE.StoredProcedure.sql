USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[F_DDL_USER_ACTIVE]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[F_DDL_USER_ACTIVE]
	
AS
BEGIN

	SET NOCOUNT ON;
	
	SELECT 0 as UserId, '' as Email,' ---Select User--- ' as UserName
	UNION
	SELECT UserId, Email,UserName
	FROM IssueTracker_Users WHERE UserName not like '%select%' and UserId <> 0 and UserName <> '' and IsActive = 1
	ORDER BY UserName
	
	SET NOCOUNT OFF ; 


END

GO
