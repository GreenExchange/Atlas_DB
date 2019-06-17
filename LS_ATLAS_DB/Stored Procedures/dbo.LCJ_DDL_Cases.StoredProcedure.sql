USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_DDL_Cases]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[LCJ_DDL_Cases]
AS
--ALTER TABLE #tmpCases
--	(Case_Id nvarchar(100), Name varchar(100))

begin
--insert into #tmpClientNames values(0, Null)
--insert into #tmpCases values(0,'...Select Case...')
--insert into #tmpCases

	SELECT   DISTINCT Case_Id, Upper(ISNULL(InjuredParty_LastName, '') + ', ' + ISNULL(InjuredParty_FirstName, ''))  AS Name
	FROM         tblCase
	WHERE     (1 = 1)
--IF @Alpha = 'ALL'
--	select Case_Id, Name  from #tmpCases  order by 2
--	drop table #tmpCases
--ELSE
	--select Client_ID, Client_Name  from #tmpClientNames where Client_Name LIKE @Alpha + '%' order by 2
end

GO
