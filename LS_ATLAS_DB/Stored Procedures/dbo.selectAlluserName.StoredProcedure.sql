USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[selectAlluserName]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[selectAlluserName]
@DomainId NVARCHAR(50)
as
begin
select distinct UserName,IsActive from IssueTracker_Users WHERE DomainId=@DomainId
end

GO
