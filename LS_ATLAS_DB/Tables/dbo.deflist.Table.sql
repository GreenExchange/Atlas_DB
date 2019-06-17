USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[deflist]    Script Date: 6/17/2019 2:22:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[deflist](
	[DEFENDANTNAME] [nvarchar](255) NULL,
	[ID] [int] NULL,
	[CNT] [int] NULL,
	[NEWID] [int] NULL,
	[DomainId] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[deflist] ADD  DEFAULT ('h1') FOR [DomainId]
GO
