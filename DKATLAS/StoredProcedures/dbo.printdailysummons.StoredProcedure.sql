USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[printdailysummons]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--ALTER TABLE DAILYSUMMONS(CASE_ID VARCHAR(50))

CREATE PROCEDURE [dbo].[printdailysummons]
as
begin
select * from lcj_vw_casesearchdetails where case_id in (select case_id from DAILYSUMMONS) order by case_id
end
GO
