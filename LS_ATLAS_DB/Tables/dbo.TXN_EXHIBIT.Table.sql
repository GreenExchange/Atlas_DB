USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[TXN_EXHIBIT]    Script Date: 6/17/2019 2:22:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TXN_EXHIBIT](
	[EXHIBIT_SEQ] [int] NULL,
	[EXHIBIT_NAME] [nvarchar](100) NULL,
	[DomainId] [nvarchar](512) NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TXN_EXHIBIT] ADD  DEFAULT ('h1') FOR [DomainId]
GO
