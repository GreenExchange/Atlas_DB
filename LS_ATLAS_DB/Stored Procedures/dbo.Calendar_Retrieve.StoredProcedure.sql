USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[Calendar_Retrieve]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Calendar_Retrieve]
(
	@DomainID						VARCHAR(50),
	@s_a_user_id					VARCHAR(100) = '',
	@s_a_case_id					NVARCHAR(MAX) = '',
	@s_a_court_id					NVARCHAR(MAX) = '',
	@s_a_event_type					NVARCHAR(MAX) = '',
	@dt_a_from_date					DATETIME = '7/16/2013',
	@dt_a_to_date					DATETIME ='7/16/2013'
)
AS
BEGIN		
   SET NOCOUNT ON 
   
   IF @dt_a_from_date=''
     set @dt_a_from_date = (SELECT CONVERT(VARCHAR(10),GETDATE(),101))
   IF @dt_a_to_date=''
    set @dt_a_to_date = (SELECT CONVERT(VARCHAR(10),GETDATE(),101))
   SELECT 
        EVT.Event_Id,
		EVT.CASE_ID [CASE_ID],
		EVTTYPE.EVENTTYPENAME[EVENT_TYPE],
		EVTSTATUS.EVENTSTATUSNAME [EVENT_STATUS], 
		CONVERT(NVARCHAR(11),EVT.EVENT_DATE,101) [EVENT_DATE], 
		ISNULL(CONVERT(NVARCHAR(5),EVT.EVENT_TIME,114),'')[EVENT_TIME],
		ISNULL(EVT.EVENT_NOTES,'') [EVENT_DESCRIPTION],
		EVT.ASSIGNED_TO[ASSIGNED_TO],
		PROVIDER_NAME[PROVIDER_NAME], 
		INJUREDPARTY_NAME[INJUREDPARTY_NAME], 
		Court_Name[COURT_NAME],
		COURT_VENUE[COURT_VENUE],
		INDEXORAAA_NUMBER[INDEXORAAA_NUMBER],
		DEFENDANT_NAME[DEFENDANT_NAME],
		INSURANCECOMPANY_NAME[INSURANCECOMPANY_NAME],
		VW.STATUS [STATUS],
		Claim_Amount [CLAIM_AMOUNT],
		EVENT_DATE,
		COURT_VENUE + '/' + EVTTYPE.EVENTTYPENAME+'/' +	EVTSTATUS.EVENTSTATUSNAME  AS Calendar_Subject,
		(select 
		    TOP 1  I.FileName
         from 
            dbo.TBLDOCIMAGES I
            Join dbo.tblImageTag IT on IT.ImageID=i.ImageID
            Join dbo.tblTags T on T.NodeID = IT.TagID And T.NodeName ='TRIAL SUBMISSION' and T.CaseID= EVT.CASE_ID ORDER BY DateInserted DESC) AS TRIAL_SUBMISSION_File,
		'Edit' AS Edit_Text
	FROM 
		TBLEVENT EVT 
	JOIN TBLEVENTTYPE EVTTYPE WITH(NOLOCK) ON EVTTYPE.EVENTTYPEID = EVT.EVENTTYPEID and EVTTYPE.DomainId =@DomainID
	JOIN TBLEVENTSTATUS EVTSTATUS WITH(NOLOCK)  ON EVTSTATUS.EVENTSTATUSID = EVT.EVENTSTATUSID and EVTSTATUS.DomainId =@DomainID
	JOIN LCJ_VW_CASESEARCHDETAILS VW  WITH(NOLOCK) ON EVT.CASE_ID=VW.CASE_ID and VW.DomainId =@DomainID
	WHERE 
		EVT.DomainId = @DomainID AND
		 CONVERT(VARCHAR(10),Event_Date,101) BETWEEN @dt_a_from_date AND @dt_a_to_date AND
		 (@s_a_user_id = '' OR  EVT.Assigned_To = @s_a_user_id)   AND
		 (@s_a_case_id = '' OR  EVT.Case_id = @s_a_case_id)   AND
		 (@s_a_court_id  ='' OR VW.Court_Id IN (SELECT items FROM dbo.SplitStringInt(@s_a_court_id,',')))  AND
		 (@s_a_event_type  ='' OR EVT.EventTypeId IN (SELECT items FROM dbo.SplitStringInt(@s_a_event_type,',')))
		 
	ORDER BY 
		Court_Name,
		COURT_VENUE,
		EVT.EVENT_TIME 
			
		
	SET NOCOUNT OFF			
END
GO
