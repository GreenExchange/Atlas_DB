USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[MST_STATUS_LOG]    Script Date: 6/17/2019 2:22:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MST_STATUS_LOG](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CASE_ID] [nvarchar](100) NULL,
	[DATE_CHANGED] [datetime] NULL,
	[STATUS_BIT] [int] NULL,
	[DomainId] [nvarchar](512) NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[MST_STATUS_LOG] ADD  DEFAULT ('h1') FOR [DomainId]
GO
