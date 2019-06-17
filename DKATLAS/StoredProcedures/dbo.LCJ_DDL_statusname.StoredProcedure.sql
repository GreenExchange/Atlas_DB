USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_DDL_statusname]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LCJ_DDL_statusname]
  
As
 
Begin
select  '' [EventStatusid], '...Select status type to assign...' [EventStatusName]
	union
  select EventStatusid,EventStatusName from tblEventstatus
order by EventStatusName
end
GO
