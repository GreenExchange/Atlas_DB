USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[ProviderCleanUP]    Script Date: 6/17/2019 2:22:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProviderCleanUP](
	[id] [int] NULL,
	[code] [nvarchar](255) NULL,
	[name] [nvarchar](255) NULL,
	[countcases] [int] NULL,
	[NEWID] [int] NULL,
	[DomainId] [nvarchar](512) NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ProviderCleanUP] ADD  DEFAULT ('h1') FOR [DomainId]
GO
