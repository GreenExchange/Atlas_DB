USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_DDL_DefendantNames]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LCJ_DDL_DefendantNames]
/*
	(
		@parameter1 datatype = default value,
		@parameter2 datatype OUTPUT
	)
*/
AS
--ALTER TABLE #tmpDefendantNames
--	(Defendant_Id nvarchar(100), Defendant_Name varchar(400))

begin
--insert into #tmpClientNames values(Null, Null)
--insert into #tmpDefendantNames values(0,'...Select Defendant...')
--insert into #tmpDefendantNames

	SELECT '0' AS Defendant_Id, ' ----Select Defendant--- ' AS Defendant_Name
	UNION
	SELECT    DISTINCT Defendant_Id, Upper(ISNULL(Defendant_DisplayName, '')) AS Defendant_Name
	FROM         tblDefendant
	WHERE     (1 = 1) AND (ACTIVE=1) 
order by defendant_name

--select Defendant_Id, Defendant_Name from #tmpDefendantNames order by 2

--drop  TABLE #tmpDefendantNames
end
GO
