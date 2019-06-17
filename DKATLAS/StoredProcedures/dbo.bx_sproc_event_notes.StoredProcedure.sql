USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[bx_sproc_event_notes]    Script Date: 6/17/2019 2:53:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		srosenthal
-- ALTER date: 8/28/08
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[bx_sproc_event_notes] 
	
	@event_id int  
	 
AS
BEGIN
	
	SET NOCOUNT ON;

 
	SELECT ev_notes from bx_events where event_id=@event_id
END
GO
