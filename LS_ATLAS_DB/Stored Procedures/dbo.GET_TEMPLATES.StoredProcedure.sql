USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[GET_TEMPLATES]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GET_TEMPLATES]
AS
BEGIN
	SELECT * FROM MST_TEMPLATES WHERE SZ_TEMPLATE_FORMAT = 'RTF'
END

GO
