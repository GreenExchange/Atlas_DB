USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[XN_TEMP_ANT_3]    Script Date: 6/17/2019 2:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[XN_TEMP_ANT_3](
	[ACCOUNT NUMBER] [float] NULL,
	[LAST NAME] [nvarchar](255) NULL,
	[FIRST NAME] [nvarchar](255) NULL,
	[BILLED AMOUNT] [float] NULL,
	[DOS] [datetime] NULL,
	[INSURANCE] [nvarchar](255) NULL,
	[COMMENT] [nvarchar](255) NULL,
	[DOS AFTER 10 MONTHS] [nvarchar](255) NULL,
	[DOS AFTER 12 MONTHS] [nvarchar](255) NULL,
	[LIT or not] [nvarchar](255) NULL,
	[Provider] [varchar](100) NULL,
	[PurchaseDate] [varchar](100) NULL,
	[ClaimNo] [varchar](100) NULL,
	[DOL] [varchar](100) NULL,
	[STATUS_DONE] [varchar](100) NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TREATMENT_ID] [int] NULL
) ON [PRIMARY]
GO
