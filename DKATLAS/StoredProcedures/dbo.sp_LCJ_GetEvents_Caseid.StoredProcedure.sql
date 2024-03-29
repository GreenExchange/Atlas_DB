USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[sp_LCJ_GetEvents_Caseid]    Script Date: 6/17/2019 2:54:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_LCJ_GetEvents_Caseid]    
(    
 @Case_id varchar(50)    
)    
as    
begin    
 select evt.case_id [Case Id],evt.event_id [Event Id],evtType.EventTypeName[Event Type],evtStatus.EventStatusName [Event Status],convert(nvarchar(11),evt.Event_Date,113) [Event Date],LTRIM(RIGHT(CONVERT(VARCHAR(20),Event_Time, 100), 7))    
  [Event Time],isnull(evt.Event_Notes,'') [Event Description],evt.assigned_to[Assigned To],Provider_name[Provider Name], InjuredParty_Name[InjuredParty Name], Court_Venue[Court Venue],    
  isnull(IndexOrAAA_Number,'-') [IndexOrAAA Number], isnull(Defendant_Name,'-') [Defendant Name], InsuranceCompany_Name[InsuranceCompany Name],evt.eventtypeid [EventTypeID],    
  convert(nvarchar(10),evt.Event_Date,101) [evtmmddyy],evt.eventstatusid [EventStatusID] , isnull(evt.arbitrator_id,2) [ArbitratorId],  
  (select arbitrator_name from tblarbitrator where arbitrator_id = evt.arbitrator_id) [ArbitratorName]  
  from tblevent evt join tbleventtype evtType on evtType.eventtypeid = evt.eventtypeid    
  join tbleventstatus evtStatus on evtStatus.eventstatusid = evt.eventstatusid join LCJ_VW_CaseSearchDetails vw on evt.Case_id=vw.Case_id where evt.Case_id = @Case_id  
 order by  evt.Event_Date desc ,evt.Event_Time desc,evt.Assigned_To asc   
end
GO
