USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[ECMC_Insurance]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ECMC_Insurance]
AS
BEGIN
	SELECT '------'[Code],'---SELECT---'[Desc]
	UNION
	SELECT distinct Insurance[Code],Insurance[Desc] from ECMC WHERE Insurance is not null
	ORDER BY 1
END

GO
