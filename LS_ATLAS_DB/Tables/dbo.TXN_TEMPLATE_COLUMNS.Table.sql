USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[TXN_TEMPLATE_COLUMNS]    Script Date: 6/17/2019 2:22:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TXN_TEMPLATE_COLUMNS](
	[I_TEMPLATE_ID] [int] NOT NULL,
	[SZ_MERGE_FIELD] [nvarchar](255) NOT NULL,
	[SZ_DATA_FIELD] [nvarchar](255) NOT NULL
) ON [PRIMARY]
GO
