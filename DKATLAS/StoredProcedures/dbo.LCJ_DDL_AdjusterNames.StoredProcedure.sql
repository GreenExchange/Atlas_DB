USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_DDL_AdjusterNames]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LCJ_DDL_AdjusterNames]
/*
	(
		@parameter1 datatype = default value,
		@parameter2 datatype OUTPUT
	)
*/
AS
--ALTER TABLE #tmpAdjusters
	--(Adjuster_Id int, Adjuster_Name varchar(200))

begin
--insert into #tmpAdjusters values(0,'...Select Adjuster...')
--insert into #tmpAdjusters

	SELECT    Adjuster_Id, LTRIM(RTRIM(Upper(ISNULL(Adjuster_FirstName, '') + ' ' + ISNULL(Adjuster_LastName, '')))) AS Adjuster_Name
	FROM         tblAdjusters
	WHERE     (1 = 1 ) order by adjuster_name-- AND (LastName <> '= ""') AND (FirstName <> '= ""')

--select Adjuster_Id, Adjuster_Name from #tmpAdjusters order by 2
--drop table #tmpAdjusters
end
GO
