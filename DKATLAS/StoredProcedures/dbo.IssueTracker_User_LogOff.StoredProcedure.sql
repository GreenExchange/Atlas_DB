USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[IssueTracker_User_LogOff]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[IssueTracker_User_LogOff] 
  @LoginId int
AS
update IssueTracker_Users_LoginTime
set Logout_time=getdate()
where AutoId=@LoginId
GO
