USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_DDL_ClientNames]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[LCJ_DDL_ClientNames]

	--(
		--@parameter1 datatype = default value,
		--@parameter2 datatype OUTPUT
		--@Alpha VARCHAR(5)
	--)

AS
--ALTER TABLE #tmpClientNames
--	(Client_ID nvarchar(100), Client_Name varchar(400))

begin
--insert into #tmpClientNames values(0, Null)
--insert into #tmpClientNames values(0,'...Select Client...')
--insert into #tmpClientNames

	SELECT   DISTINCT Client_Id, Upper(ISNULL(Client_Name, '')) AS Client_Name
	FROM         tblClient
	WHERE     (1 = 1)
--IF @Alpha = 'ALL'
--	select Client_ID, Client_Name  from #tmpClientNames  order by 2
--ELSE
	--select Client_ID, Client_Name  from #tmpClientNames where Client_Name LIKE @Alpha + '%' order by 2

--drop table #tmpClientNames
end

GO
