USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[TXN_SET_ORDER]    Script Date: 6/17/2019 2:22:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TXN_SET_ORDER](
	[AUTO_ID] [int] IDENTITY(1,1) NOT NULL,
	[SZ_IMAGEID] [varchar](500) NULL,
	[SZ_FILENAME] [varchar](1000) NULL,
	[SZ_FILEPATH] [varchar](5000) NULL,
	[SEQ_ORDER] [int] NULL,
	[DomainId] [nvarchar](512) NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TXN_SET_ORDER] ADD  DEFAULT ('h1') FOR [DomainId]
GO
