USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_DDL_AdjusterNames]    Script Date: 6/17/2019 2:29:45 AM ******/
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
@DomainId NVARCHAR(50)
AS
--ALTER TABLE #tmpAdjusters
	--(Adjuster_Id int, Adjuster_Name varchar(200))

begin
--insert into #tmpAdjusters values(0,'...Select Adjuster...')
--insert into #tmpAdjusters
 SELECT '0' as Adjuster_Id,' ---Select Adjuster--- ' as Adjuster_Name
  UNION
	SELECT    Adjuster_Id, LTRIM(RTRIM(Upper(ISNULL(Adjuster_FirstName, '') + ' ' + ISNULL(Adjuster_LastName, '')))) AS Adjuster_Name
	FROM         tblAdjusters 
	WHERE     (1 = 1 ) AND DomainId=@DomainId  order by adjuster_name-- AND (LastName <> '= ""') AND (FirstName <> '= ""')

--select Adjuster_Id, Adjuster_Name from #tmpAdjusters order by 2
--drop table #tmpAdjusters
end

GO
