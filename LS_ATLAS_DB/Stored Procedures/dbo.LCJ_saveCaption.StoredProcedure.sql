USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_saveCaption]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LCJ_saveCaption](
@cid varchar(50),
@caption nvarchar(3000)
)
as
begin
declare
@gid int
select @gid = group_id from tblcase where case_id=@cid
if @gid <> 0
update tblcase set caption = @caption where group_id=@gid 
else
update tblcase set caption = @caption where case_id=@cid
end

GO
