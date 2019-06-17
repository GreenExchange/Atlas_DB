USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_DDL_RoleNames]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LCJ_DDL_RoleNames]
@DomainId NVARCHAR(50)
AS
CREATE TABLE #tmpRolesNames
	(RoleId int, RoleName varchar(50))

begin
insert into #tmpRolesNames

	SELECT  RoleId, RoleName from IssueTracker_Roles WHERE DomainId=@DomainId
	
select RoleId, RoleName from #tmpRolesNames order by 2
end

GO
