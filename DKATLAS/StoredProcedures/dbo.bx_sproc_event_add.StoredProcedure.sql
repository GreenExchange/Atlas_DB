USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[bx_sproc_event_add]    Script Date: 6/17/2019 2:53:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		srosenthal
-- ALTER date: 8/23/2008
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[bx_sproc_event_add] 
		@case_id int = NULL , @ev_notes varchar (500) = NULL,
	@ev_datetime_start datetime ,@ev_datetime_end datetime, @ev_type smallint,@ev_remind_before datetime,
@ev_remind_every int = 30,@ev_remind_user VARCHAR(20) = NULL,@ev_private bit
AS
DECLARE @NOTES VARCHAR(500),@EVENT_TYPE_DESC VARCHAR(50)
BEGIN
	
	SET NOCOUNT ON;
IF @EV_REMIND_USER IS NULL OR @EV_REMIND_USER='' 
BEGIN
SELECT  @EV_REMIND_USER=BX_USER_ID FROM BX_USERS WHERE BX_USER_NAME=USER_NAME() AND ACTIVE =1
END


   INSERT INTO BX_EVENTS (ev_notes,ev_datetime_start,ev_datetime_end,ev_type,ev_remind_before,ev_remind_every,ev_remind_user,ev_case_id,ev_private)
	VALUES (@ev_notes,@ev_datetime_start,@ev_datetime_end,@ev_type ,@ev_remind_before,@ev_remind_every,@ev_remind_user,@case_id,@ev_private)

	IF EXISTS (SELECT CASE_ID FROM [BX_CASE] WHERE CASE_ID=@CASE_ID) 
	BEGIN
	SELECT     @EVENT_TYPE_DESC=EVENT_DESC
	FROM         BX_EVENT_TYPES 
	WHERE		EVENT_TYPE_ID = @EV_TYPE

	SET @NOTES = 'EVENT POSTED FOR  ' + convert(varchar(24),@ev_datetime_start) + ': ' + @EVENT_TYPE_DESC
	EXEC BX_SP_ADD_NOTES @CASE_ID=@CASE_ID,@DESC=@NOTES,@TYPE ='CALENDAR',@PRIORITY=0

	END

END
GO
