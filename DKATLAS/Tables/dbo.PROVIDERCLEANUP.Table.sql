USE [DKATLAS]
GO
/****** Object:  Table [dbo].[PROVIDERCLEANUP]    Script Date: 6/17/2019 2:53:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PROVIDERCLEANUP](
	[id] [int] NULL,
	[code] [nvarchar](255) NULL,
	[name] [nvarchar](255) NULL,
	[countcases] [int] NULL,
	[NEWID] [int] NULL
) ON [PRIMARY]
GO
