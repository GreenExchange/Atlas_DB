USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[WINAPP_GET_LOGIN_INGO]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WINAPP_GET_LOGIN_INGO]
	@USER_NAME VARCHAR(8000),
	@PASSWORD VARCHAR(8000)
AS
BEGIN
	SELECT TOP 1 * FROM IssueTracker_Users TU WHERE TU.username=@USER_NAME
		and UserPassword=@PASSWORD
END

GO
