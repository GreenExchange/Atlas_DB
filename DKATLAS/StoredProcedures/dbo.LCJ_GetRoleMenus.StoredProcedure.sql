USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_GetRoleMenus]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LCJ_GetRoleMenus] 
(
@RoleId int,
@MenuId int
)
AS


begin
	IF  @MenuId=0
		Begin
			select m.MenuName,m.menuId from tblMenu m join tblMenu_Access a on m.menuId=a.menuid
			where a.roleid=@RoleId and ParentId IS null and MenuName <> 'LogOff'
		End
	Else
		Begin
			select m.MenuName,m.menuId from tblMenu m join tblMenu_Access a on m.menuId=a.menuid
			where a.roleid=@RoleId and m.Parentid=@MenuId
		End

end
GO
