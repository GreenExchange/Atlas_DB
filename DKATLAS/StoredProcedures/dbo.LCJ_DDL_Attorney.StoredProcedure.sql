USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_DDL_Attorney]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LCJ_DDL_Attorney]

AS
begin

 
	SELECT  UserName, UserId FROM IssueTracker_Users WHERE RoleId = 22
    ORDER BY UserName

end
GO
