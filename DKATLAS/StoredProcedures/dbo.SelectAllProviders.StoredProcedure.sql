USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[SelectAllProviders]    Script Date: 6/17/2019 2:54:07 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[SelectAllProviders]
(
    @UserId nvarchar(50)
)
as
begin
select Provider_Name from tblProvider where Provider_Id in(select Provider_Id from TXN_PROVIDER_LOGIN where user_id=@UserId) order by Provider_Name
end
GO
