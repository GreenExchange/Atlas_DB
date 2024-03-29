USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_ADDROLE]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LCJ_ADDROLE]
(
@DomainId nvarchar(50),
@RoleName nvarchar(50)
)

As
begin
Insert into IssueTracker_Roles
(
DomainId,
RoleName ,
RoleType
)
values
(
@DomainId,
@RoleName,
'S'
)

Declare @RoleId int
Set @RoleId=(Select max(RoleId) From IssueTracker_Roles WHERE @DomainId = DomainId)

Insert into tblmenu_access
(
DomainId, Roleid,MenuId
)
values
(
@DomainId,@RoleId,7
)

end

GO
