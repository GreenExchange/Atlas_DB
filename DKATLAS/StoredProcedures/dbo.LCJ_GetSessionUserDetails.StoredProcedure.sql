USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_GetSessionUserDetails]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LCJ_GetSessionUserDetails] --[LCJ_GetSessionUserDetails] 'tech'
(
	@UserName NVarchar(255)
)
AS

SELECT UserId, Username, UserTypeLogin, UserType,U.RoleId,DisplayName,RoleName from IssueTracker_Users U
INNER JOIN IssueTracker_Roles R ON  R.RoleId=U.RoleId
where UserName = LTRIM(RTRIM(@UserName))
GO
