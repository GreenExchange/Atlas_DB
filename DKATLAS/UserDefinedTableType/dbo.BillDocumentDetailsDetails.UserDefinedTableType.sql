USE [DKATLAS]
GO
/****** Object:  UserDefinedTableType [dbo].[BillDocumentDetailsDetails]    Script Date: 6/17/2019 2:53:52 AM ******/
CREATE TYPE [dbo].[BillDocumentDetailsDetails] AS TABLE(
	[FileName] [varchar](200) NULL,
	[Path] [varchar](2000) NULL,
	[NodeType] [varchar](100) NULL,
	[BasePathId] [int] NULL,
	[BaseFilePath] [varchar](200) NULL,
	[BasePathType] [varchar](10) NULL
)
GO
