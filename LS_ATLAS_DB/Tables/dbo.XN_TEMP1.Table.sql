USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[XN_TEMP1]    Script Date: 6/17/2019 2:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[XN_TEMP1](
	[CaseId] [varchar](50) NULL,
	[DOS] [date] NULL,
	[Amount] [float] NULL,
	[SPECIALTY] [nchar](10) NULL,
	[DatePurchased] [date] NULL
) ON [PRIMARY]
GO
