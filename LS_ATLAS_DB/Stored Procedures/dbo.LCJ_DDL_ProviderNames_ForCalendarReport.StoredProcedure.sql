USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_DDL_ProviderNames_ForCalendarReport]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
/* Previously Called LCJ_DDL_ClientNames */
CREATE PROCEDURE [dbo].[LCJ_DDL_ProviderNames_ForCalendarReport]

	--(
		--@parameter1 datatype = default value,
		--@parameter2 datatype OUTPUT
		--@Alpha VARCHAR(5)
	--)

AS
--ALTER TABLE #tmpProviderNames
--	(Provider_ID nvarchar(100), Provider_Name varchar(400))

begin
--insert into #tmpClientNames values(0, Null)
--insert into #tmpProviderNames values('ALL','...ALL...')
--insert into #tmpProviderNames

	SELECT   DISTINCT Provider_Id, Upper(ISNULL(Provider_Name, '')) AS Provider_Name
	FROM         tblProvider
	WHERE     (1 = 1) order by Provider_Name
--IF @Alpha = 'ALL'
--	select Provider_ID, Provider_Name  from #tmpProviderNames  order by 2
--	drop table #tmpProviderNames
--ELSE
	--select Client_ID, Client_Name  from #tmpClientNames where Client_Name LIKE @Alpha + '%' order by 2
end

GO
