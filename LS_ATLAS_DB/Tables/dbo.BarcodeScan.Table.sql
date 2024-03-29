USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[BarcodeScan]    Script Date: 6/17/2019 2:22:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BarcodeScan](
	[ImageId] [int] IDENTITY(1,1) NOT NULL,
	[FileName] [nvarchar](100) NULL,
	[ImagePath] [nvarchar](255) NULL,
	[BarcodeVal] [nvarchar](50) NULL,
	[ScanDate] [datetime] NULL,
	[UserId] [nchar](10) NULL,
	[DomainId] [nvarchar](50) NULL,
	[DocType] [nvarchar](100) NULL,
	[BarcodeFormat] [nvarchar](100) NULL,
	[ActiveFlag] [bit] NULL,
 CONSTRAINT [PK_BarcodeScan] PRIMARY KEY CLUSTERED 
(
	[ImageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
