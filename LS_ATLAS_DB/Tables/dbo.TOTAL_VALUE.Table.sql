USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[TOTAL_VALUE]    Script Date: 6/17/2019 2:22:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TOTAL_VALUE](
	[TOTAL_VALUE] [int] NULL,
	[DomainId] [nvarchar](512) NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TOTAL_VALUE] ADD  DEFAULT ('h1') FOR [DomainId]
GO
