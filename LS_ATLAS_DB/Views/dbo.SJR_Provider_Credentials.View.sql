USE [LS_ATLAS_DB]
GO
/****** Object:  View [dbo].[SJR_Provider_Credentials]    Script Date: 6/17/2019 2:29:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[SJR_Provider_Credentials]
as
SELECT     tblProvider.Provider_Name, IssueTracker_Users.UserName,IssueTracker_Users.UserPassword
FROM         IssueTracker_Users INNER JOIN
                      tblProvider ON IssueTracker_Users.UserTypeLogin = convert(varchar(50),tblProvider.Provider_Id)
GO
