USE [DKATLAS]
GO
/****** Object:  Table [dbo].[GreenBillsCases]    Script Date: 6/17/2019 2:53:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GreenBillsCases](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SZ_COMPANY_ID] [nvarchar](20) NOT NULL,
	[SZ_CASE_ID] [nvarchar](20) NOT NULL,
	[SZ_CASE_NO] [nvarchar](50) NOT NULL,
	[FHKP_CASE_ID] [nvarchar](50) NULL,
	[fhkp_provider_id] [varchar](500) NULL
) ON [PRIMARY]
GO
