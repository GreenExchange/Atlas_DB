USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_GetAllMenus]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LCJ_GetAllMenus]
(
@RoleId int,
@MenuId int
)
AS

begin



	--SELECT  MenuId, MenuName from tblMenu where menuid not in (select MenuId from tblmenu_access where roleid=@RoleId) and menuid not in(7)

IF  @MenuId=0
begin
	select menuid,menuname from tblmenu 
	where menuid not in (select menuid  from tblmenu_access where roleid=@RoleId) and parentid is null
end
else
Begin
		select menuid,menuname from tblmenu 
	where menuid not in (select menuid  from tblmenu_access where roleid=@RoleId) and parentid=@MenuId
end

end
GO
