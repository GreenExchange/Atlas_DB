USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[tblBarcodes]    Script Date: 6/17/2019 2:22:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblBarcodes](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[BarcodeValue] [nvarchar](200) NOT NULL,
	[PrintedDate] [datetime] NULL,
	[UserName] [nvarchar](50) NULL,
	[DomainId] [nvarchar](512) NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblBarcodes] ADD  DEFAULT ('h1') FOR [DomainId]
GO
