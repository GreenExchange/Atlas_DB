USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[CCPortfolio]    Script Date: 6/17/2019 2:22:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CCPortfolio](
	[Client ] [varchar](50) NULL,
	[Portfolio#] [varchar](50) NULL,
	[Program Name] [varchar](50) NULL,
	[AdvanceRate] [varchar](50) NULL,
	[Initial Fee] [varchar](50) NULL,
	[Reserve] [varchar](50) NULL,
	[Monthly Fee] [varchar](50) NULL,
	[Paiment Factor] [varchar](50) NULL,
	[InitailFeeTime] [varchar](50) NULL
) ON [PRIMARY]
GO
