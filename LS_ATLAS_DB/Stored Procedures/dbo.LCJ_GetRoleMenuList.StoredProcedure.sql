USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_GetRoleMenuList]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LCJ_GetRoleMenuList]  --[LCJ_GetRoleMenuList] 'priya','admin'
		@DomainId NVARCHAR(50),
		@UserName nvarchar(50)
AS
BEGIN
	Declare @RoleId int 
	
	Set @RoleId=(Select RoleId From dbo.IssueTracker_Users Where UserName=@UserName and DomainId=@DomainId)

	

	Select  TOP 1 MenuID, MenuName,MenuLink,Description, ParentID  from tblMenu 
	where ((MenuID in (Select MenuID From tblMenu_Access Where RoleId=@RoleId  )
		 and 
		ParentID in (Select MenuID From tblMenu_Access Where RoleId=@RoleId )) 
		OR
		MenuID in (Select MenuID From tblMenu_Access Where RoleId=@RoleId )
		 and 
		ParentID IS NULL) and MenuName= 'Dashboard'  

	--select * from #temp 
    union all
		Select MenuID, MenuName,MenuLink,Description, ParentID from tblMenu 
		where ((MenuID in (Select MenuID From tblMenu_Access Where RoleId=@RoleId  )
		 and 
		ParentID in (Select MenuID From tblMenu_Access Where RoleId=@RoleId )) 
		OR
		MenuID in (Select MenuID From tblMenu_Access Where RoleId=@RoleId )
		 and 
		ParentID IS NULL) and MenuName <> 'Association' AND  MenuName<>'Dashboard' and MenuName <> 'LogOff'	 and MenuID not in(8,9)
		
		UNION ALL

		Select MenuID, MenuName,(MenuLink + @UserName) as MenuLink,Description, ParentID from tblMenu 
		where ((MenuID in (Select MenuID From tblMenu_Access Where RoleId=@RoleId )
		 and 
		ParentID in (Select MenuID From tblMenu_Access Where RoleId=@RoleId )) 
		OR
		MenuID in (Select MenuID From tblMenu_Access Where RoleId=@RoleId )
		 and 
		ParentID IS NULL) and MenuName = 'Association' AND  MenuName<>'Dashboard' and MenuID not in(8,9)	

		union all
		Select MenuID, MenuName,MenuLink,Description, ParentID from tblMenu 
		where ((MenuID in (Select MenuID From tblMenu_Access Where RoleId=@RoleId  )
		 and 
		ParentID in (Select MenuID From tblMenu_Access Where RoleId=@RoleId )) 
		OR
		MenuID in (Select MenuID From tblMenu_Access Where RoleId=@RoleId )
		 and 
		ParentID IS NULL) and  MenuName = 'LogOff'	 and MenuID not in(8,9)
END

GO
