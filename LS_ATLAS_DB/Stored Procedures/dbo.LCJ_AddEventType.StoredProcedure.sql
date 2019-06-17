USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_AddEventType]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LCJ_AddEventType]
(
@DomainId varchar(50),
@EventTypeName varchar(100)
)
as
begin
insert into tblEventType(DomainID,EventTypeName)  values (@EventTypeName,@DomainId)
end

GO
