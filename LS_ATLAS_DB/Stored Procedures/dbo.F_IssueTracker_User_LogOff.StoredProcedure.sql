USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[F_IssueTracker_User_LogOff]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[F_IssueTracker_User_LogOff] 
  @DomainId NVARCHAR(50),
  @i_a_LoginSessionID int
AS
BEGIN
     IF(@i_a_LoginSessionID <> 0)
     BEGIN
          UPDATE IssueTracker_Users_LoginTime
          SET Logout_time=getdate()
          WHERE AutoId=@i_a_LoginSessionID
		  AND DomainId=@DomainId
     END
END

GO
