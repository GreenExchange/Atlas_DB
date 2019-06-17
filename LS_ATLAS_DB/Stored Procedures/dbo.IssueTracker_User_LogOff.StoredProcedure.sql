USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[IssueTracker_User_LogOff]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[IssueTracker_User_LogOff] 
   @DomainId NVARCHAR(50),
  @LoginId int
AS
update IssueTracker_Users_LoginTime
set Logout_time=getdate()
where AutoId=@LoginId
and DomainId=@DomainId

GO
