USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[Provider_Documents]    Script Date: 6/17/2019 2:22:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Provider_Documents](
	[PDocID] [int] IDENTITY(1,1) NOT NULL,
	[File_Path] [nvarchar](100) NOT NULL,
	[FileName] [nvarchar](500) NOT NULL,
	[DocType_ID] [int] NOT NULL,
	[CreatedBy] [nvarchar](50) NOT NULL,
	[CreatedDate] [datetime] NULL,
	[DomainId] [nvarchar](50) NOT NULL,
	[Provider_Id] [int] NULL,
	[BasePathId] [int] NULL,
 CONSTRAINT [PK_tblProvider_Documents] PRIMARY KEY CLUSTERED 
(
	[PDocID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
