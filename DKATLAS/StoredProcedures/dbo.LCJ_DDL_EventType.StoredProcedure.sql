USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_DDL_EventType]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LCJ_DDL_EventType]
as
begin
	select  '' [EventTypeId], '...Select event type to assign...' [EventTypeName]
	union
Select EventTypeId,EventTypeName from tblEventType
order by EventTypeName
end
GO
