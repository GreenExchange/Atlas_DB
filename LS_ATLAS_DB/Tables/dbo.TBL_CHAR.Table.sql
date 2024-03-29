USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[TBL_CHAR]    Script Date: 6/17/2019 2:22:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_CHAR](
	[CHAR_STRING] [nvarchar](10) NOT NULL,
	[CHAR_VALUE] [nvarchar](50) NOT NULL,
	[CHAR_ASCII] [nchar](10) NULL,
	[DomainId] [nvarchar](512) NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TBL_CHAR] ADD  DEFAULT ('h1') FOR [DomainId]
GO
