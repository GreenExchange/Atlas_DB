USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_DDL_Their_SJ_Motion_Activity]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LCJ_DDL_Their_SJ_Motion_Activity]
AS
CREATE TABLE #tmpDDL_Their_SJ_Motion_Activity (DDL_Their_SJ_Motion_Activity varchar(100))
BEGIN
insert into #tmpDDL_Their_SJ_Motion_Activity values('No Activity')
insert into #tmpDDL_Their_SJ_Motion_Activity
SELECT DISTINCT(Their_SJ_Motion_Activity) FROM TBLCASE WHERE Their_SJ_Motion_Activity IS NOT NULL
ORDER BY Their_SJ_Motion_Activity ASC

select * from  #tmpDDL_Their_SJ_Motion_Activity
drop table #tmpDDL_Their_SJ_Motion_Activity

END

--execute LCJ_DDL_Their_SJ_Motion_Activity

GO
