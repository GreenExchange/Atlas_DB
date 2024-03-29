USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[InsertProvList]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[InsertProvList]
(
  @UserName nvarchar(255),
  @UserPassword nvarchar(50),
  @ProviderId nvarchar(50) 
)
as
declare @userID int
begin
set @userID=(select UserId from IssueTracker_Users where UserName=@UserName and UserPassword=@UserPassword)

insert into TXN_PROVIDER_LOGIN(Provider_id,user_id)
values(@ProviderId,@userID)
end
GO
