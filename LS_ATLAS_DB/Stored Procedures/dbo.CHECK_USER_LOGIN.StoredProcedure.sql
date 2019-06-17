USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[CHECK_USER_LOGIN]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CHECK_USER_LOGIN]
	@SZ_USER_NAME nvarchar(20),
	@SZ_PASS_CODE nvarchar(20)
as
	Select 
		USERNAME 
	From
		dbo.IssueTracker_Users
	Where 
		USERNAME=@SZ_USER_NAME
		AND USERPASSWORD=@SZ_PASS_CODE

GO
