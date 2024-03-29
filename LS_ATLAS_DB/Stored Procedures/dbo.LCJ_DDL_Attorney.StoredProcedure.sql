USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_DDL_Attorney]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LCJ_DDL_Attorney]
@DomainId NVARCHAR(50)
AS
begin

 select Attorney_Id, Ltrim(Upper(ISNULL(Attorney_FirstName, '') + ' ' +  ISNULL(Attorney_LastName, ''))) as Attorney_Name from tblAttorney  
 WHERE DomainId = @DomainId
 order by Attorney_Name

	--SELECT  UserName, UserId FROM IssueTracker_Users WHERE RoleId = 22
 --   ORDER BY UserName

end

GO
