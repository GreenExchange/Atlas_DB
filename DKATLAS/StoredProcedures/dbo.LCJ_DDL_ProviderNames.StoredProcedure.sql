USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_DDL_ProviderNames]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[LCJ_DDL_ProviderNames]
AS
	SELECT '0' AS Provider_Id, ' --- Select Provider --- ' AS Provider_Name
	UNION
	SELECT   Provider_Id, CASE WHEN FH_ACTIVE=1 THEN tblProvider.Provider_Name +ISNULL('[' + PROVIDER_LOCAL_ADDRESS + ']','') + Isnull('    [ '+tblProvider.Provider_GroupName + ' ]','') 
	ELSE  tblProvider.Provider_Name + 'ZZZ### INACTIVE ###' END as Provider_Name
	FROM tblProvider wHERE(1 = 1)
	Order BY Provider_Name asc
GO
