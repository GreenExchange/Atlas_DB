USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[F_DDL_ProviderGroup]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[F_DDL_ProviderGroup] -- [F_DDL_ProviderGroup] 'GLF'
(
	@DomainID VARCHAR(50)
)
AS
BEGIN

	SET NOCOUNT ON;
	
	SELECT '0' as Provider_Group_ID,' ---Select  Provider Group--- ' as Provider_Group_Name, '' AS Provider_Group_Name_Value
	UNION
	SELECT Provider_Group_ID AS Provider_Group_ID , Provider_Group_Name as Provider_Group_Name, Provider_Group_Name AS Provider_Group_Name_Value
	FROM TblProvider_Groups 
	WHERE 
	 DomainID = @DomainID
	ORDER BY Provider_Group_Name
	
	SET NOCOUNT OFF ; 

END

GO
