USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[sp_Get_Use_Role_By_UserId]    Script Date: 6/17/2019 2:54:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[sp_Get_Use_Role_By_UserId]   --'tech'
       @UserId      NVARCHAR(500)=1  
AS  
BEGIN  
print @UserId
    DECLARE @username AS NVARCHAR(MAX)
    SELECT RoleName from dbo.IssueTracker_Roles where RoleId =(SELECT RoleId  from dbo.IssueTracker_Users where UserName =@UserId)   
  END
GO
