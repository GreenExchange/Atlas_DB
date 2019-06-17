USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_DDL_statusname]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LCJ_DDL_statusname]
@DomainId NVARCHAR(50)  
As
 
Begin
	select  '' [EventStatusId], ' ---Select Event Status--- ' [EventStatusName]
	union
	select EventStatusid,EventStatusName from tblEventstatus WHERE DomainId=@DomainId
order by EventStatusName
end

GO
