USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[Deleteproviders_of_userid]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[Deleteproviders_of_userid]
(
   @UserName nvarchar(255),
   @UserPassword nvarchar(50)
)
as
declare @userid nvarchar(50)
begin
set @userid=(select UserId from IssueTracker_Users where UserName=@UserName and UserPassword=@UserPassword)
delete from TXN_PROVIDER_LOGIN where user_id=@userid
end

GO
