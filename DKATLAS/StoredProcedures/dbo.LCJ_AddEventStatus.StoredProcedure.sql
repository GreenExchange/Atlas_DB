USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_AddEventStatus]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LCJ_AddEventStatus]
(
@EventStatusName varchar(500)
)
as
begin
insert into tblEventStatus(EventStatusName) values (@EventStatusName)
end
GO
