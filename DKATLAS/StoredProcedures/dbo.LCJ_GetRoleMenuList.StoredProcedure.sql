USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_GetRoleMenuList]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LCJ_GetRoleMenuList]  --[LCJ_GetRoleMenuList] 'tech'
		@UserName nvarchar(50)
AS
BEGIN
	Declare @RoleId int 
	
	Set @RoleId=(Select RoleId From dbo.IssueTracker_Users Where UserName=@UserName)

	Select MenuID, MenuName,MenuLink,Description, ParentID from tblMenu 
	where ((MenuID in (Select MenuID From tblMenu_Access Where RoleId=@RoleId)
		 and 
		ParentID in (Select MenuID From tblMenu_Access Where RoleId=@RoleId)) 
		OR
		MenuID in (Select MenuID From tblMenu_Access Where RoleId=@RoleId)
		 and 
		ParentID IS NULL) and MenuName <> 'Association'
		
		UNION ALL

		Select MenuID, MenuName,(MenuLink + @UserName) as MenuLink,Description, ParentID from tblMenu 
	where ((MenuID in (Select MenuID From tblMenu_Access Where RoleId=@RoleId)
		 and 
		ParentID in (Select MenuID From tblMenu_Access Where RoleId=@RoleId)) 
		OR
		MenuID in (Select MenuID From tblMenu_Access Where RoleId=@RoleId)
		 and 
		ParentID IS NULL) and MenuName = 'Association'
END
GO
