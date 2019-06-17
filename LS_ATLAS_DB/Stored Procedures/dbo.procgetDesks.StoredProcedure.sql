USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[procgetDesks]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[procgetDesks](
@UserName varchar(40)
)
as
begin
if @username <> ''
select a.UserName,a.Desk_id, b.Desk_Name from tbluserDesk a inner join tbldesk b on a.desk_id=b.desk_id where a.UserName=@UserName
else
select a.UserName,a.Desk_id, b.Desk_Name from tbluserDesk a inner join tbldesk b on a.desk_id=b.desk_id where a.UserName='slaxman'

end

GO
