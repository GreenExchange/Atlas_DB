USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_DeleteRole]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LCJ_DeleteRole]
(
@RoleId int
)
as
begin

declare @countrole as int
set @Countrole=(select count(roleid) from tblMenu_Access where roleid=1)
if @countrole>1 
begin
delete from tblmenu_access where roleid=@roleid and menuid=7
delete from IssueTracker_Roles where RoleId= + @RoleId
end
end
GO
