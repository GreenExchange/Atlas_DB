USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[F_DDL_USER_FOR_EVENT]    Script Date: 6/17/2019 2:54:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[F_DDL_USER_FOR_EVENT]
	
AS
BEGIN

	SET NOCOUNT ON;
	
	SELECT 0 as UserId, '' as Email,' ---Select User--- ' as UserName
	UNION
	SELECT UserId, Email,UserName
	FROM IssueTracker_Users WHERE UserName not like '%select%' and UserId <> 0 and UserName <> '' and IsActive = 1 
	 AND ISNULL(UserType,'') not in ('OSS','P') --and RoleId in (7,10)
	ORDER BY UserName
	
	SET NOCOUNT OFF ; 


END
GO
