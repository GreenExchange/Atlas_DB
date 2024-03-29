USE [DKATLAS]
GO
/****** Object:  Table [dbo].[docs]    Script Date: 6/17/2019 2:53:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[docs](
	[docID] [int] IDENTITY(1,1) NOT NULL,
	[pdfID] [int] NOT NULL,
	[docDate] [datetime] NOT NULL,
	[docDateModified] [datetime] NULL,
	[docStatus] [int] NOT NULL,
	[docSettings] [int] NOT NULL,
	[docFileName] [nvarchar](200) NOT NULL,
	[docXml] [ntext] NOT NULL,
	[docOutputData] [image] NULL,
 CONSTRAINT [PK_docs] PRIMARY KEY CLUSTERED 
(
	[docID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
