USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[Get_NoticeofTrial_Report]    Script Date: 6/17/2019 2:54:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_NoticeofTrial_Report]    --[dbo].[Get_NoticeofTrial_Report] 'FH07-42372,FH13-109852,FH09-59092'







	@case_id nvarchar(Max)







AS







DECLARE @Cases AS NVARCHAR(MAX)







set @Cases=REPLACE (''''+@case_id+'''',',',''',''')







declare @query varchar(MAX)















BEGIN







    set @query='







		select case_id,injuredparty_lastname+'',''+injuredparty_firstname as [injuredparty_name],Provider_Name + ISNULL('' [ '' + Provider_Groupname + '' ]'','''') as  provider_name,







		provider_groupname,insurancecompany_name,







		fee_schedule,paid_amount,fee_schedule - paid_amount as [balance],







		indexoraaa_number,status,Initial_Status,(dateofservice_Start+''-''+dateofservice_End) AS [DOS Range],court_name,defendant_name,defendant_Address,







		defendant_city,defendant_state,defendant_zip,convert(VARCHAR(10),Served_On_Date,1) as [Served_On_Date] ,convert(VARCHAR(10),date_answer_received,1) as date_answer_received,







		convert(Varchar(10),DateNotice_TrialFiled,1) as DateNotice_TrialFiled,







		(select count(*) from tblimages where case_id=a.case_id and documentid=20) as [NOT_IN_SCANDOC],







		(	select 







    COUNT(Filename)







         from 







            dbo.TBLDOCIMAGES I







            Join dbo.tblImageTag IT on IT.ImageID=i.ImageID







            Join dbo.tblTags T on T.NodeID = IT.TagID And T.NodeName =''NOTICE OF TRIAL'' and T.CaseID= a.CASE_ID ) AS NOT_IN_DM,







		(select count(*) from tblimages where case_id=a.case_id and documentid=439) as [NOT_CON_IN_SCANDOC],







			(	select 







    COUNT(Filename)







         from 







            dbo.TBLDOCIMAGES I







            Join dbo.tblImageTag IT on IT.ImageID=i.ImageID







            Join dbo.tblTags T on T.NodeID = IT.TagID And T.NodeName =''NOTICE OF TRIAL CONFIRMED'' and T.CaseID= a.CASE_ID ) AS NOT_Con_IN_DM,







		Case WHEN







Exists(select * from tbltransactions where case_id=a.CASE_ID and transactions_type=''FFB'' and (transactions_description = ''NOTICE OF TRIAL FEE'' OR transactions_description = ''NOT'' OR transactions_description = ''NOTICE OF TRIAL''))







THEN ''YES''







ELSE ''No'' END







 as [Billed_NOT_Fee]







		from LCJ_VW_CaseSearchDetails a







		where case_id in ('+@Cases+')'







		exec(@query)







print @Cases







print @case_id







END
GO
