USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_DDL_MainMenuNames]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LCJ_DDL_MainMenuNames]
AS
CREATE TABLE #tmpMainMenuNames
	(MenuId int, MenuName varchar(50))

begin
insert into #tmpMainMenuNames

	SELECT  MenuId, MenuName from tblMenu where menuid in(1,2,3,4,5,6)
	
select MenuId, MenuName from #tmpMainMenuNames order by 2
end
GO
