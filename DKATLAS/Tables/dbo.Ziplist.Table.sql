USE [DKATLAS]
GO
/****** Object:  Table [dbo].[Ziplist]    Script Date: 6/17/2019 2:53:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ziplist](
	[City] [nvarchar](255) NULL,
	[ST] [nvarchar](255) NULL,
	[ZipCode] [nvarchar](255) NULL,
	[TelNo] [nvarchar](255) NULL,
	[FIPS] [nvarchar](255) NULL,
	[County] [nvarchar](255) NULL,
	[Pref] [nvarchar](255) NULL,
	[Type] [nvarchar](255) NULL
) ON [PRIMARY]
GO
