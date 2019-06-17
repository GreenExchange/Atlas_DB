USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_DDL_EventType]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LCJ_DDL_EventType]
@DomainId NVARCHAR(50)
as
begin
	select  '' [EventTypeId], ' ---Select Event Type--- ' [EventTypeName]
	union
Select EventTypeId,EventTypeName from tblEventType WHERE DomainId=@DomainId
order by EventTypeName
end

GO
