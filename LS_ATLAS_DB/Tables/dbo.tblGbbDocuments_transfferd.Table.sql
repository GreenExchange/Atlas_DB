USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[tblGbbDocuments_transfferd]    Script Date: 6/17/2019 2:22:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblGbbDocuments_transfferd](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Path] [varchar](2000) NULL,
	[NodeType] [varchar](100) NULL,
	[BasePathId] [int] NULL,
	[TransferFilePath] [varchar](2000) NULL,
	[BillNumber] [varchar](50) NULL,
	[Gbb_Type] [varchar](50) NULL,
	[Trnasfferd_Date] [datetime] NULL
) ON [PRIMARY]
GO
