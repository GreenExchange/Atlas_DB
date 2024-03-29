USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_DDL_Court]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[LCJ_DDL_Court]
(
	@DomainId NVARCHAR(50)
)
AS
begin

   SELECT '0' as Court_ID,' --- Select Court Name --- ' as Court_Name
    UNION
	SELECT   DISTINCT Court_ID, Upper(ISNULL(Court_Name, '')) AS Court_Name
	FROM         tblCourt
	WHERE     (1 = 1) and DomainId=@domainId order by Court_Id

end

GO
