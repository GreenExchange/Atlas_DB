USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[F_DDL_ProviderGroup1]    Script Date: 6/17/2019 2:54:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[F_DDL_ProviderGroup1]
	
AS
BEGIN

	SET NOCOUNT ON;
	
	SELECT '0' as Provider_Group_ID,' ---Select Group--- ' as Provider_Group_Name
	UNION
	SELECT Provider_Group_ID AS Provider_Group_ID, Provider_Group_Name as Provider_Group_Name 
	FROM TblProvider_Groups WHERE DESCRIPTION not like '%select%' and DESCRIPTION <> ''
	ORDER BY Provider_Group_Name
	
	SET NOCOUNT OFF ; 

END
GO
