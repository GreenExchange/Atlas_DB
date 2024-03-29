USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_GetSessionUserDetailsByID]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LCJ_GetSessionUserDetailsByID]-- [LCJ_GetSessionUserDetailsByID] '39654'  
(  
 @DomainId NVARCHAR(50),  
 @UserID NVarchar(255)  
)  
AS  
  
SELECT Username, UserTypeLogin, UserType,RoleId,DisplayName,UserPassword from IssueTracker_Users 
where UserId  = @UserID and DomainId=@DomainId  
  
GO
