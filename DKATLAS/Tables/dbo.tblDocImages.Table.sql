USE [DKATLAS]
GO
/****** Object:  Table [dbo].[tblDocImages]    Script Date: 6/17/2019 2:53:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDocImages](
	[ImageID] [bigint] IDENTITY(1,1) NOT NULL,
	[Filename] [varchar](255) NOT NULL,
	[FilePath] [varchar](255) NOT NULL,
	[OCRData] [text] NULL,
	[Status] [bit] NULL,
	[is_saga_doc] [bit] NULL,
	[nodeid] [bigint] NULL,
	[createduser] [varchar](200) NULL,
	[Revisededuser] [varchar](200) NULL,
	[createddate] [datetime] NULL,
	[Revisededdate] [datetime] NULL,
	[from_flag] [int] NULL,
	[description] [varchar](500) NULL,
	[DOCUMENTID] [bigint] NULL,
	[imageid1] [int] NULL,
	[BasePathId] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
