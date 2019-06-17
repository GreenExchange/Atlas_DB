USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_ADDROLE]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LCJ_ADDROLE]
(
@RoleName nvarchar(50)
)

As
begin
Insert into IssueTracker_Roles
(
RoleName 
)
values
(
@RoleName
)

Declare @RoleId int
Set @RoleId=(Select max(RoleId) From IssueTracker_Roles)

Insert into tblmenu_access
(
Roleid,MenuId
)
values
(
@RoleId,7
)

end
GO
