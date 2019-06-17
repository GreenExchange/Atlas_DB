USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_RemoveCaseFromGroup]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LCJ_RemoveCaseFromGroup](
@Case_Id varchar(50)
)
as
begin
exec LCJ_procRemoveGroupCase @Case_id  = @Case_Id
update tblCase set Group_Id=0 where Case_Id=@Case_Id
end

GO
