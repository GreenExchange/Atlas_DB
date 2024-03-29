USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[IssueTracker_User_Authenticate]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[IssueTracker_User_Authenticate] 
  @Username NVarChar(255),
  @Password NVarChar(255)
AS
Declare @userId as nvarchar(50)
Declare @AutoId as nvarchar(50)
set @userId =(SELECT UserId FROM IssueTracker_Users WHERE Username = @Username AND UserPassword = @Password and IsActive='True')
IF EXISTS( SELECT UserId FROM IssueTracker_Users WHERE Username = @Username AND UserPassword = @Password and IsActive='True')
begin
insert into IssueTracker_Users_LoginTime(UserId,Login_Time) values (@userId,getdate())
set @AutoId=(select top 1 AutoId from IssueTracker_Users_LoginTime order by Login_Time desc)
RETURN @AutoId
End
ELSE
RETURN -1
GO
