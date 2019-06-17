USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[F_DDL_Court]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[F_DDL_Court]
(
	@DomainID VARCHAR(50)
)	
AS
BEGIN

	SET NOCOUNT ON;
	
	SELECT '0' as Court_Id,' ---Select Court--- ' as Court_Name
	UNION
	SELECT Court_Id,Court_Name FROM tblCourt WHERE Court_Name not like '%select%' and Court_Id <> 0 AND DomainID = @DomainID ORDER BY Court_Name
	
	SET NOCOUNT OFF ;



END

GO
