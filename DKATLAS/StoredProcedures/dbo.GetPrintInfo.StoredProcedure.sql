USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[GetPrintInfo]    Script Date: 6/17/2019 2:54:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetPrintInfo](  
@dt1 varchar(50),  
@dt2 varchar(50),  
@printtype varchar(100),  
@status varchar(50),
@opened_by varchar(100)
)  
as  
begin  
declare  
@st nvarchar(1000)  
  
  set @st = 'select case_id,CASE_CODE,injuredparty_name,provider_name,insurancecompany_name,claim_amount,paid_amount,
  date_opened,date_summons_printed,served_on_date,indexoraaa_number,status,initial_status,court_name,opened_by from lcj_vw_casesearchdetails where   
  CAST(FLOOR(CAST(' + @printtype + ' AS FLOAT))AS DATETIME) >= Replace(''' + @dt1 + ''',''/'',''-'') and  
  CAST(FLOOR(CAST('+@printtype+' AS FLOAT))AS DATETIME) <= Replace(''' + @dt2+''',''/'',''-'') '  
  if @status <> 'ALL'  
  set @st = @st + ' and status = ''' + @status + ''' order by court_name,case_id'  
  else  
   if @opened_by <> 'ALL'  
  set @st = @st + ' and opened_by = ''' + @opened_by + ''' order by court_name,case_id'  
  else  
  set @st = @st + '  order by court_name,case_id'  
  --print @st  
  execute sp_executesql @st  
end
GO
