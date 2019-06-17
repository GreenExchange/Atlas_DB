USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_MenuToRole]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LCJ_MenuToRole]
(
@RoleId int,
@MenuId int
)
as 
begin
insert into tblmenu_access
(
RoleId,
MenuId
)
values
(
@RoleId,
@MenuId
)
end
GO
