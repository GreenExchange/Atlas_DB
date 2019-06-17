USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[GET_PROVIDER_GROUPNAMES]    Script Date: 6/17/2019 2:54:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GET_PROVIDER_GROUPNAMES]
AS
BEGIN
	SELECT 
	Provider_Group_ID,
		[Provider_Group_Name],
		[DESCRIPTION],
		[SD_CODE],
		[AF_Show]
	FROM
		TblProvider_Groups
END
GO
