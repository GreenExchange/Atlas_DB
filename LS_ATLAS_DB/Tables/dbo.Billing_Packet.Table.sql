USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[Billing_Packet]    Script Date: 6/17/2019 2:22:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Billing_Packet](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Case_ID] [varchar](50) NOT NULL,
	[DomainID] [varchar](50) NULL,
	[Packeted_Case_ID] [varchar](50) NULL,
	[Notes] [varchar](2000) NULL,
	[created_by_user] [varchar](255) NULL,
	[created_date] [datetime] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Billing_Packet] ADD  CONSTRAINT [DF__Billing_P__creat__7AB2122C]  DEFAULT (getdate()) FOR [created_date]
GO
