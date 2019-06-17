USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_DDL_RoleNames]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LCJ_DDL_RoleNames]
AS
CREATE TABLE #tmpRolesNames
	(RoleId int, RoleName varchar(50))

begin
insert into #tmpRolesNames

	SELECT  RoleId, RoleName from IssueTracker_Roles 
	
select RoleId, RoleName from #tmpRolesNames order by 2
end
GO
