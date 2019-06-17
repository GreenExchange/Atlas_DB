USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[GreenBillsInsurance]    Script Date: 6/17/2019 2:22:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GreenBillsInsurance](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SZ_COMPANY_ID] [varchar](100) NOT NULL,
	[SZ_INSURANCE_ID] [varchar](100) NOT NULL,
	[INSURANCECOMPANY_ID] [int] NULL,
	[Gbb_Type] [varchar](20) NOT NULL,
	[DomainID] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
