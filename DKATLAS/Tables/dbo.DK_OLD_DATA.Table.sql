USE [DKATLAS]
GO
/****** Object:  Table [dbo].[DK_OLD_DATA]    Script Date: 6/17/2019 2:53:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DK_OLD_DATA](
	[SZ_PATIENT_FIRST_NAME] [nvarchar](255) NULL,
	[SZ_PATIENT_LAST_NAME] [nvarchar](255) NULL,
	[Date_AAA_Arb_Filed] [datetime] NULL,
	[old_Case_id] [float] NULL,
	[IndexOrAAA_Number] [nvarchar](255) NULL,
	[FLT_BILL_AMOUNT] [float] NULL,
	[Status_Done] [nvarchar](255) NULL,
	[SZ_INSURANCE_NAME] [nvarchar](255) NULL,
	[FLT_PAID] [float] NULL,
	[Provider_Name] [nvarchar](255) NULL,
	[AssignLaw_firm] [nvarchar](255) NULL,
	[ProviderID] [float] NULL,
	[InsuranceCompanyId] [float] NULL,
	[Status_Done_old] [nvarchar](255) NULL,
	[autoid] [float] NULL,
	[Status] [nvarchar](255) NULL
) ON [PRIMARY]
GO
