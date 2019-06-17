USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[ECMC_Ac_Type]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ECMC_Ac_Type]
AS
BEGIN
	SELECT '------'[Code],'---SELECT---'[Desc]
	UNION
	SELECT distinct [Account Type][Code],[Account Type][Desc] from ECMC WHERE [Account Type] is not null
	ORDER BY 1
END

GO
