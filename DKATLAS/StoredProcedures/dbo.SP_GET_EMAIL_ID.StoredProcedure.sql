USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[SP_GET_EMAIL_ID]    Script Date: 6/17/2019 2:54:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GET_EMAIL_ID] -- 'vinay'
(
	@SZ_USER_NAME AS NVARCHAR(50)
)
AS
BEGIN
	SELECT Email [MailID] FROM IssueTracker_Users where UserName = @SZ_USER_NAME 
END
GO
