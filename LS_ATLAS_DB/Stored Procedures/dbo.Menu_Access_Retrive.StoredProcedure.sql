USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[Menu_Access_Retrive]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Menu_Access_Retrive]
(
	@s_a_Type Varchar(200),
	@DomainId Varchar(200)= null,
	@roleid Varchar(200)=null,
	@menuid Varchar(200)=null
)
AS
begin
SET NOCOUNT ON;

	IF(@s_a_Type = 'ALLMenu')
    BEGIN 
		select * from tblmenu
	END	 	
	ELSE IF(@s_a_Type = 'SelectedRole')
    BEGIN
		select menuid,menuname from tblmenu
		where menuid in (select menuid  from tblmenu_access where DomainId = @DomainId and roleid=@roleid And parentid is Not null)
		UNION
		select menuid,menuname from tblmenu
		where menuid in (select menuid  from tblmenu_access where DomainId = @DomainId and roleid=@roleid 
		And parentid is null and MenuID NOT IN(SELECT ISNULL(parentid,'') From tblmenu))
    END
  --  ELSE IF(@s_a_Type = 'SelectedNodeValue')
  --  BEGIN
  --   select menuid,menuname from tblmenu
	 --where menuid in (select menuid  from tblmenu_access where DomainId = @DomainId and roleid=@roleid And menuid = @menuid)
		
  --  END
	
END
 

GO
