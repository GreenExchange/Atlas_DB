USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[Deleteuser]    Script Date: 6/17/2019 2:54:00 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[Deleteuser]
(
   @UserId nvarchar(55)
)
as
begin
update IssueTracker_Users
set IsActive='False'
where UserId=@UserId
--delete from TXN_PROVIDER_LOGIN where user_id=@UserId
end
GO
