USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[F_Case_Event_Retrive]    Script Date: 6/17/2019 2:54:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[F_Case_Event_Retrive] --[F_Case_Event_Retrive] 'FH12-96549'
(
	@s_a_CASE_ID NVARCHAR(50) = 'FH07-42372',
	@i_a_Event_id INT = 0
)
AS        
BEGIN  

	SELECT 
		EVE.Case_id,
		EVE.Event_id,
		CONVERT(VARCHAR(10),EVE.Event_Date,101) + ' '+ LTRIM(RIGHT(CONVERT(VARCHAR(20),EVE.Event_Time, 100), 7)) AS Event_Date_Time,
		Event_Date,
		ISNULL(EVE_TYPE.EventTypeId,0) AS EventTypeId,
		ISNULL(EVE_TYPE.EventTypeName,0) AS EventTypeName,
		ISNULL(EVE_STATUS.EventStatusName,'') AS EventStatusName,
		ISNULL(EVE_STATUS.EventStatusId,0) AS EventStatusId,
		ISNULL(EVE.Event_Notes,'') AS Event_Notes,
		Assigned_To,
		ISNULL(USR.UserId,0) AS Assigned_To_ID,
		ISNULL(ARB.ARBITRATOR_ID,0) AS ARBITRATOR_ID,
		ISNULL(ARB.ARBITRATOR_NAME,'') AS ARBITRATOR_NAME
	FROM
		tblEvent EVE
	LEFT OUTER JOIN 
		tblEventType EVE_TYPE on EVE_TYPE.EventTypeId = EVE.EventTypeId    
	LEFT OUTER JOIN 
		tblEventStatus EVE_STATUS on EVE_STATUS.EventStatusId = EVE.EventStatusId
	LEFT OUTER JOIN
		TblArbitrator ARB ON ARB.ARBITRATOR_ID = EVE.arbitrator_id
	LEFT OUTER JOIN
		IssueTracker_Users USR ON USR.UserName = EVE.Assigned_To
			
	WHERE 
		EVE.Case_id = @s_a_CASE_ID
		
	ORDER BY 
		EVE.Event_Date DESC
		
	--SELECT
	--	evt.case_id [Case Id],
	--	evt.event_id [Event Id],
	--	evtType.EventTypeName[Event Type],
	--	evtStatus.EventStatusName [Event Status],
	--	convert(nvarchar(11),evt.Event_Date,113) [Event Date],
	--	isnull(convert(nvarchar(5),evt.Event_Time,114),'') [Event Time],
	--	isnull(evt.Event_Notes,'') [Event Description],
	--	evt.assigned_to[Assigned To],
	--	Provider_name[Provider Name],
	--	InjuredParty_Name[InjuredParty Name],
	--	Court_Venue[Court Venue],    
	--	isnull(IndexOrAAA_Number,'-') [IndexOrAAA Number],
	--	isnull(Defendant_Name,'-') [Defendant Name],
	--	InsuranceCompany_Name[InsuranceCompany Name],
	--	evt.eventtypeid [EventTypeID],    
	--	convert(nvarchar(10),evt.Event_Date,101) [evtmmddyy],
	--	evt.eventstatusid [EventStatusID] ,
	--	isnull(evt.arbitrator_id,2) [ArbitratorId],  
	--	(select arbitrator_name from tblarbitrator where arbitrator_id = evt.arbitrator_id) [ArbitratorName]  
 -- FROM 
	--	tblevent evt 
	--	join tbleventtype evtType on evtType.eventtypeid = evt.eventtypeid    
	--	join tbleventstatus evtStatus on evtStatus.eventstatusid = evt.eventstatusid 
	--	join LCJ_VW_CaseSearchDetails vw on evt.Case_id=vw.Case_id where evt.Case_id = @Case_id  
 --order by  
	--	evt.Event_Date desc ,evt.Event_Time desc,evt.Assigned_To asc    

	
END
GO
