USE [DKATLAS]
GO
/****** Object:  Table [dbo].[toBeCollected]    Script Date: 6/17/2019 2:53:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[toBeCollected](
	[Case_Id] [varchar](50) NULL,
	[Principal] [varchar](200) NULL,
	[Interest] [varchar](200) NULL,
	[FilingFee] [varchar](200) NULL,
	[AttorneyFee] [varchar](200) NULL
) ON [PRIMARY]
GO
