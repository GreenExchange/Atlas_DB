USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[F_DDL_EventType]    Script Date: 6/17/2019 2:54:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[F_DDL_EventType]
	
AS
BEGIN

	SET NOCOUNT ON;
	
	SELECT '0' as EventTypeId,' ---Select Event Type--- ' as EventTypeName
	UNION
	SELECT EventTypeId,LTRIM(RTRIM(EventTypeName)) FROM tblEventType WHERE EventTypeName not like '%select%' and EventTypeId <> 0  ORDER BY EventTypeName
	
	SET NOCOUNT OFF ;



END
GO
