USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_GETfirmchecks]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LCJ_GETfirmchecks] (
@DomainId NVARCHAR(50),
@dt1 datetime,
@dt2 datetime
)
as
begin
select a.*,b.* from lcj_vw_casesearchdetails a inner join tbltransactions b
on a.case_id=b.case_id where transactions_type in ('AF','FFC') and 
cast(floor(convert( float,b.transactions_date)) as datetime)>= @dt1 and cast(floor(convert( float,b.transactions_date)) as datetime) <= @dt2
and b.DomainId=@DomainId
order by b.transactions_date
end

GO
