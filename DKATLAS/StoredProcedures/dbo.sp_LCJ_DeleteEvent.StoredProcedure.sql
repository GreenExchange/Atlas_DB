USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[sp_LCJ_DeleteEvent]    Script Date: 6/17/2019 2:54:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_LCJ_DeleteEvent]
(
@szEventID varchar(50)
)
as
Declare @id as nvarchar(50)
begin
set @id=(select case_id from tblevent where event_id = @szEventID)
	delete from tblevent where event_id = @szEventID

update tblevent
set status =1
where event_id in (select event_id from tblevent where event_id in(select a.event_id from (select * from tblevent where event_date=(select max(event_date) from tblevent where case_id=@id)and case_id=@id)a where a.event_time=(select max(a.event_time) from (select * from tblevent where event_date=(select max(event_date) from tblevent where case_id=@id)and case_id=@id)a)))
end
GO
