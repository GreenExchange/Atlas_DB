USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[selectAlluserName]    Script Date: 6/17/2019 2:54:07 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[selectAlluserName]
as
begin
select distinct UserName,IsActive from IssueTracker_Users 
end
GO
