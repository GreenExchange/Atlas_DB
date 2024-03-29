USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[Menu_Access_Save]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[Menu_Access_Save] 
(
	@i_a_roleid int,
	@s_a_menuid varchar(4000),
	@s_a_Created_By_User varchar(100)
)
as
BEGIN
	DECLARE @s_l_notes_desc	VARCHAR(4000)
	DECLARE @s_l_role_name	VARCHAR(200)
 --	select * from tblMenu_Access
	BEGIN TRAN
		SET @s_l_role_name = (select top 1 RoleName from IssueTracker_Roles where RoleId = @i_a_roleid)

		DELETE FROM tblmenu_access WHERE RoleId = @i_a_roleid 
		and MenuId NOT in(select s from dbo.SplitString(@s_a_menuid,',') WHERE s <>'')

		insert into tblmenu_access (roleid,menuid) 
		SELECT @i_a_roleid, s as MenuID from dbo.SplitString(@s_a_menuid,',')
		WHERE s <>'' and s NOT in(select MenuId  FROM tblmenu_access WHERE RoleId = @i_a_roleid) 

		SET @s_l_notes_desc = 'Menu Assigned to the role -'+ @s_l_role_name	

		EXEC F_AdminNotes_Add @s_a_notes_desc=@s_l_notes_desc,@s_a_User_Id = @s_a_Created_By_User,@s_a_notes_type='Menu Assign' 
		      
	COMMIT TRAN 
	SELECT 'Menu assigned successfully' AS [Message]
END





GO
