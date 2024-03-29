USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[bx_sproc_event_reminder_details]    Script Date: 6/17/2019 2:53:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		srosenthal
-- ALTER date: 8/29/2008
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[bx_sproc_event_reminder_details] 
	
AS
BEGIN
	
	SET NOCOUNT ON;

   
	SELECT     BX_EVENTS.EV_DATETIME_START, BX_EVENT_TYPES.EVENT_DESC, BX_EVENTS.EV_CASE_ID, BX_EVENTS.EV_PRIVATE, BX_EVENTS.EVENT_ID, 
                      BX_EVENTS.EV_REMIND_BEFORE, [BX_CASE].CASE_ID_LONG
FROM         BX_EVENT_TYPES INNER JOIN
                      BX_EVENTS ON BX_EVENT_TYPES.EVENT_TYPE_ID = BX_EVENTS.EV_TYPE INNER JOIN
                      BX_USERS ON BX_EVENTS.EV_REMIND_USER = BX_USERS.BX_USER_ID LEFT OUTER JOIN
                      [BX_CASE] ON BX_EVENTS.EV_CASE_ID = [BX_CASE].CASE_ID

WHERE (BX_USERS.BX_USER_NAME = USER_NAME()OR EV_REMIND_USER='<EVERYONE>') AND  BX_EVENTS.EV_REMIND_STATUS =1 AND BX_EVENTS.EV_REMIND_BEFORE <= GETDATE()
END
GO
