USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_DDL_uniqueProviderNames]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
/* Previously Called LCJ_DDL_ClientNames */
CREATE PROCEDURE [dbo].[LCJ_DDL_uniqueProviderNames]

	--(
		--@parameter1 datatype = default value,
		--@parameter2 datatype OUTPUT
		--@Alpha VARCHAR(5)
	--)

AS
SELECT   DISTINCT Provider_Id, tblProvider.Provider_Name +Isnull('    [ '+tblProvider.Provider_GroupName + ' ]','') as Provider_Name FROM tblProvider wHERE(Provider_Name not in(''))  order by provider_name asc

GO
