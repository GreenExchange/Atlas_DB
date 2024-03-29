USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[tblGbbDocuments]    Script Date: 6/17/2019 2:22:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblGbbDocuments](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FileName] [varchar](200) NULL,
	[Path] [varchar](2000) NULL,
	[NodeType] [varchar](100) NULL,
	[BasePathId] [int] NULL,
	[BaseFilePath] [varchar](200) NULL,
	[BillNumber] [varchar](50) NULL,
	[Gbb_Type] [varchar](50) NULL,
	[DownloadStatus] [varchar](2000) NULL,
	[BasePathType] [varchar](10) NULL
) ON [PRIMARY]
GO
