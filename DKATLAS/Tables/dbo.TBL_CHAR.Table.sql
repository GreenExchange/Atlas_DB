USE [DKATLAS]
GO
/****** Object:  Table [dbo].[TBL_CHAR]    Script Date: 6/17/2019 2:53:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_CHAR](
	[CHAR_STRING] [nvarchar](10) NOT NULL,
	[CHAR_VALUE] [nvarchar](50) NOT NULL,
	[CHAR_ASCII] [nchar](10) NULL
) ON [PRIMARY]
GO
