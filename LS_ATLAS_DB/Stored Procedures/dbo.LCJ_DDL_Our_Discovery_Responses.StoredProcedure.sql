USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_DDL_Our_Discovery_Responses]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LCJ_DDL_Our_Discovery_Responses]
AS
CREATE TABLE #tmpDDL_Our_Discovery_Responses(DDL_Our_Discovery_Responses varchar(100))
BEGIN
insert into #tmpDDL_Our_Discovery_Responses values('No Activity')
insert into #tmpDDL_Our_Discovery_Responses
SELECT DISTINCT(Our_Discovery_Responses) FROM TBLCASE WHERE Our_Discovery_Responses IS NOT NULL
ORDER BY Our_Discovery_Responses ASC

select * from  #tmpDDL_Our_Discovery_Responses
drop table #tmpDDL_Our_Discovery_Responses

END

--execute LCJ_DDL_Our_Discovery_Responses

GO
