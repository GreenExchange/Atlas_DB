USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[toBeCollectedNew]    Script Date: 6/17/2019 2:22:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[toBeCollectedNew](
	[Case_Id] [varchar](50) NULL,
	[Principal] [varchar](200) NULL,
	[Interest] [varchar](200) NULL,
	[FilingFee] [varchar](200) NULL,
	[AttorneyFee] [varchar](200) NULL,
	[DomainId] [nvarchar](512) NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[toBeCollectedNew] ADD  DEFAULT ('h1') FOR [DomainId]
GO
