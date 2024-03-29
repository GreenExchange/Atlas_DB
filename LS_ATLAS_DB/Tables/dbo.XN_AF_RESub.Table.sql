USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[XN_AF_RESub]    Script Date: 6/17/2019 2:22:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[XN_AF_RESub](
	[Bill #] [nvarchar](255) NULL,
	[Case #] [float] NULL,
	[Patient Name] [nvarchar](255) NULL,
	[Claim Number] [nvarchar](255) NULL,
	[Policy Number] [nvarchar](255) NULL,
	[Insurance Name] [nvarchar](255) NULL,
	[Specialty] [nvarchar](255) NULL,
	[Bill Amount] [float] NULL,
	[Visit Date] [nvarchar](255) NULL,
	[Location] [nvarchar](255) NULL
) ON [PRIMARY]
GO
