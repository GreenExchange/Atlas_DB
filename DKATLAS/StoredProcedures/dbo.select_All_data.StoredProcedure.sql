USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[select_All_data]    Script Date: 6/17/2019 2:54:07 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[select_All_data]--45
(
  @UserId nvarchar(55)
)
as
begin
select UserName,UserPassword,DisplayName,Email,bit_for_reports_case_search,bit_for_Provider_Cases from IssueTracker_Users where UserId=@UserId
select Provider_id from TXN_PROVIDER_LOGIN where user_id=@UserId
end
GO
