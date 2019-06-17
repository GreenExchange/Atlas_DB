USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_AddEventStatus]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LCJ_AddEventStatus]
(
@DomainId varchar(50),
@EventStatusName varchar(500)
)
as
begin
insert into tblEventStatus(DomainID,EventStatusName)  values (@DomainId, @EventStatusName)
end

GO
