USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_AddEventType]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LCJ_AddEventType]
(
@EventTypeName varchar(100)
)
as
begin
insert into tblEventType(EventTypeName) values (@EventTypeName)
end
GO
