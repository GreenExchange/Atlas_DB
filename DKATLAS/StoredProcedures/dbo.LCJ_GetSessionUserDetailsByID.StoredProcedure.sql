USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_GetSessionUserDetailsByID]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LCJ_GetSessionUserDetailsByID]-- [LCJ_GetSessionUserDetailsByID] '39654'
(
	@UserID NVarchar(255)
)
AS

SELECT Username, UserTypeLogin, UserType,RoleId,DisplayName from IssueTracker_Users where UserId  = @UserID
GO
