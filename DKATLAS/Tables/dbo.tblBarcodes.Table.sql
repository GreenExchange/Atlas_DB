USE [DKATLAS]
GO
/****** Object:  Table [dbo].[tblBarcodes]    Script Date: 6/17/2019 2:53:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblBarcodes](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[BarcodeValue] [nvarchar](200) NOT NULL,
	[PrintedDate] [datetime] NULL,
	[UserName] [nvarchar](50) NULL
) ON [PRIMARY]
GO
