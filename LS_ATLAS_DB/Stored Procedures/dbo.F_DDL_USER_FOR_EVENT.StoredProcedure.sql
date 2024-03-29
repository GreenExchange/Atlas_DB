USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[F_DDL_USER_FOR_EVENT]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[F_DDL_USER_FOR_EVENT]
@DomainId NVARCHAR(50)	
AS
BEGIN

	SET NOCOUNT ON;
	
	SELECT 0 as UserId, '' as Email,' ---Select User--- ' as UserName
	UNION
	SELECT UserId, Email,UserName
	FROM IssueTracker_Users WHERE IsActive = 1 
	 AND ISNULL(UserType,'') not in ('OSS','P') 
	 and DomainId=@DomainId
	ORDER BY UserName
	
	SET NOCOUNT OFF ; 


END

GO
