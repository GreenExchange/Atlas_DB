USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[GreenBillsProviders]    Script Date: 6/17/2019 2:22:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GreenBillsProviders](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SZ_COMPANY_ID] [nvarchar](20) NOT NULL,
	[SZ_OFFICE_ID] [nvarchar](20) NOT NULL,
	[PROVIDER_ID] [int] NULL,
	[Gbb_Type] [varchar](20) NULL,
	[DomainId] [varchar](50) NOT NULL,
	[Initial_Status] [varchar](200) NULL,
	[Status] [varchar](500) NULL
) ON [PRIMARY]
GO
