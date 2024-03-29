USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[tblImages]    Script Date: 6/17/2019 2:22:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblImages](
	[ImagePath] [nvarchar](255) NOT NULL,
	[FileName] [nvarchar](100) NOT NULL,
	[ImageId] [int] IDENTITY(1,1) NOT NULL,
	[DocumentId] [nvarchar](20) NOT NULL,
	[Case_Id] [nvarchar](50) NOT NULL,
	[ScanDate] [smalldatetime] NOT NULL,
	[UserId] [varchar](50) NULL,
	[RecordDescriptor] [varchar](220) NULL,
	[DeleteFlag] [int] NULL,
	[DomainId] [nvarchar](512) NOT NULL,
 CONSTRAINT [PK_tblImages] PRIMARY KEY CLUSTERED 
(
	[ImageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblImages] ADD  CONSTRAINT [DF_tblImages_DeleteFlag]  DEFAULT ((0)) FOR [DeleteFlag]
GO
ALTER TABLE [dbo].[tblImages] ADD  DEFAULT ('h1') FOR [DomainId]
GO
