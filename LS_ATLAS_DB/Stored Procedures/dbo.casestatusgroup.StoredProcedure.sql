USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[casestatusgroup]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[casestatusgroup](     -- casestatusGroup @dt1='03/01/2014',@dt2='03/10/2014',@printtype='Date_Opened',@initial_status='Closed',@opened_by='mferreira' 
@dt1 varchar(50),
@dt2 varchar(50),
@printtype varchar(100),
@status varchar(50),
@opened_by varchar(100)
)
as
begin
SET NOCOUNT ON
declare
@st nvarchar(1000)
		set @st = 'select initial_status,count(*) as [Count] from lcj_vw_casesearchdetails where 
		CAST(FLOOR(CAST(' + @printtype + ' AS FLOAT))AS DATETIME) >= Replace(''' + @dt1 + ''',''/'',''-'') and
		CAST(FLOOR(CAST('+@printtype+' AS FLOAT))AS DATETIME) <= Replace(''' + @dt2+''',''/'',''-'') '
		if @status <> 'ALL'
		set @st = @st + ' and status = ''' + @status + ''' group by initial_status order by initial_status'
		else
		 if @opened_by <> 'ALL'  
		  set @st = @st + ' and opened_by = ''' + @opened_by + ''' group by initial_status order by initial_status'  
		  else  
		set @st = @st + ' group by initial_status order by initial_status'
		print @st
		execute sp_executesql @st
end

GO
