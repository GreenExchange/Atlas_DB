USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[bx_sproc_event_dismiss]    Script Date: 6/17/2019 2:53:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		srosenthal
-- ALTER date: 8/23/2008
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[bx_sproc_event_dismiss] 
		@event_id INT
AS
DECLARE @NOTES VARCHAR(50)
BEGIN
	
	SET NOCOUNT ON;



update  BX_EVENTS
set ev_remind_status = 0
FROM BX_EVENTS INNER JOIN BX_USERS ON BX_EVENTS.EV_REMIND_USER = BX_USERS.BX_USER_ID
where event_id = @event_id and ((BX_EVENTS.EV_PRIVATE=0) OR (BX_EVENTS.EV_PRIVATE=1 AND BX_USERS.BX_USER_NAME = USER_NAME()))

   
	

	
END
GO
