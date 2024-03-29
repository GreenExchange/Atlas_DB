USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[F_IssueTracker_User_Authenticate]    Script Date: 6/17/2019 2:54:00 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[F_IssueTracker_User_Authenticate]-- [F_IssueTracker_User_Authenticate] 'tech','lawallies12#$'
  @s_a_user_name NVARCHAR(255),
  @s_a_password NVARCHAR(255)
AS
     DECLARE @s_l_userId AS NVARCHAR(50)
     DECLARE @i_l_AutoId AS INT
     
     SET @s_l_userId =(SELECT UserId FROM IssueTracker_Users WHERE Username = @s_a_user_name AND UserPassword = @s_a_password and IsActive='True')
     
     IF EXISTS( SELECT UserId FROM IssueTracker_Users WHERE Username = @s_a_user_name AND UserPassword = @s_a_password and IsActive='True')
     BEGIN
     
          INSERT INTO IssueTracker_Users_Logintime(UserId,Login_Time) 
          VALUES (@s_l_userId,getdate())
          
          SET @i_l_AutoId=(SELECT TOP 1 AutoId FROM IssueTracker_Users_Logintime ORDER BY Login_Time DESC)
     
     END
     
     SELECT 
          @i_l_AutoId AS LoginSessionID,
          UserType,
          UserTypeLogin,
          RoleId,
          DisplayName,
          UserName,
          UserId,
          Email
     FROM IssueTracker_Users 
     WHERE Username = @s_a_user_name 
          AND UserPassword = @s_a_password 
          AND IsActive='True'
GO
