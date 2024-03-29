USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_DDL_Court]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[LCJ_DDL_Court]

	--(
		--@parameter1 datatype = default value,
		--@parameter2 datatype OUTPUT
		--@Alpha VARCHAR(5)
	--)

AS
--ALTER TABLE #tmpCourt
--	(Court_ID nvarchar(100), Court_Name varchar(100))

begin
--insert into #tmpClientNames values(0, Null)
--insert into #tmpCourt values(0,'...Select Court Type...')
--insert into #tmpCourt

	SELECT   DISTINCT Court_ID, Upper(ISNULL(Court_Name, '')) AS Court_Name
	FROM         tblCourt
	WHERE     (1 = 1) order by Court_Id
--IF @Alpha = 'ALL'
--	select Court_ID, Court_Name  from #tmpCourt  order by 1 asc
--	drop table #tmpCourt
--ELSE
	--select Client_ID, Client_Name  from #tmpClientNames where Client_Name LIKE @Alpha + '%' order by 2
end
GO
