USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[Selectuniqueusername]    Script Date: 6/17/2019 2:54:07 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[Selectuniqueusername]
as
begin
select distinct a.user_id,b.UserName from TXN_PROVIDER_LOGIN a inner join IssueTracker_Users b on a.user_id=b.UserId where b.IsActive='True'order by b.UserName
end
GO
