USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[procUserDesk]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[procUserDesk] as
begin
select  Upper(a.Desk_Name),a.desk_id from tbldesk a inner join IssueTracker_Users b on a.Desk_Name = b.UserName order by a.Desk_Name asc
end

GO
