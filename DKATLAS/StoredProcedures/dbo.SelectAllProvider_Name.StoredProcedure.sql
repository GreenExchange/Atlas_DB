USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[SelectAllProvider_Name]    Script Date: 6/17/2019 2:54:07 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[SelectAllProvider_Name]
as
begin
select Provider_Id,Provider_Name + isnull('['+ provider_groupname + ']','') as Provider_Name from tblProvider order by Provider_Name
end
GO
