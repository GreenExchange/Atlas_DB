USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[DAILYSUMMONS]    Script Date: 6/17/2019 2:22:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DAILYSUMMONS](
	[CASE_ID] [varchar](50) NULL,
	[DomainId] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DAILYSUMMONS] ADD  DEFAULT ('h1') FOR [DomainId]
GO
