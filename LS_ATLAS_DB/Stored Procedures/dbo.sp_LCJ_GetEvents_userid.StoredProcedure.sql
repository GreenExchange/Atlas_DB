USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[sp_LCJ_GetEvents_userid]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_LCJ_GetEvents_userid] 
(
@User_id varchar(50),
@Event_Date varchar(50)
)
as
begin
select evt.case_id [Case Id],evtType.EventTypeName[Event Type],evtStatus.EventStatusName [Event Status],evt.Event_Date[Event Date], isnull(convert(nvarchar(5),evt.Event_Time,114),'')
[Event Time],isnull(evt.Event_Notes,'') [Event Description],evt.assigned_to[Assigned To],Provider_name[Provider Name], InjuredParty_Name[InjuredParty Name], Court_Venue[Court Venue], 
IndexOrAAA_Number[IndexOrAAA Number], Defendant_Name[Defendant Name], InsuranceCompany_Name[InsuranceCompany Name] from tblevent evt join tbleventtype evtType on evtType.eventtypeid = evt.eventtypeid 
join tbleventstatus evtStatus on evtStatus.eventstatusid = evt.eventstatusid join LCJ_VW_CaseSearchDetails vw on evt.Case_id=vw.Case_id where evt.Event_Date = @Event_Date and evt.User_id=@User_id order by  evt.Assigned_To asc,evt.Event_Time 
end

GO
