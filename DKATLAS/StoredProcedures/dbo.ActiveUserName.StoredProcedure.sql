USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[ActiveUserName]    Script Date: 6/17/2019 2:53:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ActiveUserName]
(
   @UserName varchar(255)
)
as
begin
update IssueTracker_Users 
set IsActive='True'
where UserName=@UserName
end
GO
