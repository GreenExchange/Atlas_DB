USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_ADMIN_USERS]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[LCJ_ADMIN_USERS]


AS

Select USERID, LTRIM(RTRIM(UPPER(USERNAME))) AS USERNAME  from IssueTracker_Users where IsActive='True'
GO
