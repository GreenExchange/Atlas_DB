USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[InsertProvList]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[InsertProvList]
(
  @DomainId varchar(50),
  @UserName nvarchar(255),
  @UserPassword nvarchar(50),
  @ProviderId nvarchar(500) 
)
as
declare @userID int
begin
set @userID=(select UserId from IssueTracker_Users where UserName=@UserName and UserPassword=@UserPassword)

Delete from TXN_PROVIDER_LOGIN where user_id=@userID and DomainId = @DomainId

insert into TXN_PROVIDER_LOGIN(user_id, DomainId, Provider_id)
Select @userID, @DomainId, s from SplitString(@ProviderId,',')

--values(@ProviderId, @userID, @DomainId)
end

GO
