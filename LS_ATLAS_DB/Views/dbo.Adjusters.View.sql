USE [LS_ATLAS_DB]
GO
/****** Object:  View [dbo].[Adjusters]    Script Date: 6/17/2019 2:29:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[Adjusters]
AS
SELECT     dbo.tblAdjusters.*
FROM         dbo.tblAdjusters
GO
