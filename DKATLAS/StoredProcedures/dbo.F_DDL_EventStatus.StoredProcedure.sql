USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[F_DDL_EventStatus]    Script Date: 6/17/2019 2:54:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[F_DDL_EventStatus]
	
AS
BEGIN

	SET NOCOUNT ON;
	
	SELECT '0' as EventStatusId,' ---Select Event Status--- ' as EventStatusName
	UNION
	SELECT EventStatusId,LTRIM(RTRIM(EventStatusName)) FROM tblEventStatus WHERE EventStatusName not like '%select%' and EventStatusId <> 0  ORDER BY EventStatusName
	
	SET NOCOUNT OFF ;



END
GO
