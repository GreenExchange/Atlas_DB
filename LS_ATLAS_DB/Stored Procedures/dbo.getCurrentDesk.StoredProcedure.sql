USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[getCurrentDesk]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[getCurrentDesk](
@Case_Id varchar(40)
)
as
select b.[Desk_Name] from tblCaseDesk a inner join tbldesk b on a.desk_id=b.desk_id inner join IssueTracker_Users c on b.Desk_Name=c.UserName where a.Case_Id =@Case_Id

GO
