USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[F_MST_GetRoleMenuList]    Script Date: 6/17/2019 2:54:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[F_MST_GetRoleMenuList] 
		@UserName nvarchar(50)
AS
BEGIN
	Declare @RoleId int 
	
	Set @RoleId=(Select RoleId From dbo.IssueTracker_Users Where UserName=@UserName)

	Select MenuID, MenuName,MenuLink,Description, ParentID from tblMenu 
	where MenuLink is null
	
	
	 
	
	
	--select * from tblMenu_Access
	--select * from tblMenu
END
GO
