USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[F_DDL_Role]    Script Date: 6/17/2019 2:54:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[F_DDL_Role]
	
AS
BEGIN

	SET NOCOUNT ON;
	
	SELECT '0' as RoleID,' ---Select Role--- ' as RoleName
	UNION
	SELECT RoleId,RoleName FROM IssueTracker_Roles ORDER BY RoleName
	
	
	SET NOCOUNT OFF ;



END
GO
