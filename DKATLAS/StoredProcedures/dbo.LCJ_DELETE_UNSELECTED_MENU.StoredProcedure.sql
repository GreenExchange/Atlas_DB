USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_DELETE_UNSELECTED_MENU]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LCJ_DELETE_UNSELECTED_MENU] 
	(
	@RoleID int,
	@MenuID int
	)
AS
begin
	begin tran
	--print '[LCJ_DELETE_UNSELECTED_MENU] proc executed'
	if (@RoleID=1 and @MenuID=1)
		begin
		delete from tblmenu_access where roleid=1 and (menuid in(2,3,4,5,6)or menuid in (Select menuId From tblMenu Where ParentId in (2,3,4,5,6)))
		print 'in if'
		end
	else if(@RoleID>1 and @menuid=1)
		begin
			print 'in else'
			delete from tblMenu_Access 
			where RoleId=@RoleID 
			and 
			(MenuID in (1,2,3,4,5,6) or MenuID in (Select menuId From tblMenu Where ParentId in (1,2,3,4,5,6)))
		end		
	else
		begin
			print 'in else'
			delete from tblMenu_Access 
			where RoleId=@RoleID 
			and 
			(MenuID=@MenuID or MenuID in (Select menuId From tblMenu Where ParentId=@MenuID)and MenuId not in(1,8))
		end	
	--declare @test int

--	set @test=(select *from tblmenu_access where RoleId=@RoleID and 
--		(MenuID=@MenuID or MenuID in (Select menuId From tblMenu Where ParentId=@MenuID)))
--	print 'test=='
--	print @test
	commit tran
end
GO
