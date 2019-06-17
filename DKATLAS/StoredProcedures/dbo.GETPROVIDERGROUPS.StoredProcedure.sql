USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[GETPROVIDERGROUPS]    Script Date: 6/17/2019 2:54:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GETPROVIDERGROUPS]
AS
BEGIN
	SELECT ''[Code], ' ---Select---- ' [Description]
	UNION
	SELECT Provider_Group_Name[Code], Provider_Group_Name[Description] FROM TblProvider_Groups
END
GO
