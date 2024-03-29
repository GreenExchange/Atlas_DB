USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[bx_sproc_event_delete]    Script Date: 6/17/2019 2:53:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		srosenthal
-- ALTER date: 8/23/2008
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[bx_sproc_event_delete] 
		@event_id INT
AS
DECLARE @NOTES VARCHAR(50),@EVENT_TYPE_DESC VARCHAR(500),@case_id int
BEGIN
	
	SET NOCOUNT ON;

IF EXISTS (SELECT     [BX_CASE].CASE_ID, BX_EVENTS.EVENT_ID
FROM         [BX_CASE] INNER JOIN
                      BX_EVENTS ON [BX_CASE].CASE_ID = BX_EVENTS.EV_CASE_ID
WHERE     (BX_EVENTS.EVENT_ID = @event_id)) 
	BEGIN
	
     SELECT     @CASE_ID=[BX_CASE].CASE_ID
FROM         [BX_CASE] INNER JOIN
                      BX_EVENTS ON [BX_CASE].CASE_ID = BX_EVENTS.EV_CASE_ID
WHERE     (BX_EVENTS.EVENT_ID = @event_id)




	SELECT     @EVENT_TYPE_DESC=BX_EVENT_TYPES.EVENT_DESC
FROM         BX_EVENT_TYPES INNER JOIN
                      BX_EVENTS ON BX_EVENT_TYPES.EVENT_TYPE_ID = BX_EVENTS.EV_TYPE
WHERE     (BX_EVENTS.EVENT_ID = @EVENT_ID)

	SET @NOTES = 'EVENT DELETED : '+ @EVENT_TYPE_DESC
	EXEC BX_SP_ADD_NOTES @CASE_ID=@CASE_ID,@DESC=@NOTES,@TYPE ='DELETE',@PRIORITY=0

	END

delete from bx_events
from bx_events inner join bx_users on bx_events.ev_remind_user = bx_users.bx_user_id
where event_id = @event_id and ((BX_EVENTS.EV_PRIVATE=0) OR (BX_EVENTS.EV_PRIVATE=1 AND BX_USERS.BX_USER_NAME = USER_NAME()))

   
	

END
GO
