USE [DKATLAS]
GO
/****** Object:  Table [dbo].[TBLBILLING_DATA]    Script Date: 6/17/2019 2:53:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBLBILLING_DATA](
	[BILLING_AUTO_ID] [int] IDENTITY(1,1) NOT NULL,
	[SZ_CASE_ID] [varchar](100) NULL,
	[SZ_CASE_NO] [varchar](100) NULL,
	[SZ_PATIENT_NAME] [varchar](500) NULL,
	[SZ_PATIENT_ADDRESS] [varchar](1000) NULL,
	[SZ_PATIENT_CITY] [varchar](100) NULL,
	[SZ_PATIENT_STATE] [varchar](100) NULL,
	[SZ_PATIENT_ZIP] [varchar](100) NULL,
	[SZ_PATIENT_PHONE] [varchar](50) NULL,
	[DT_DATE_OF_ACCIDENT] [varchar](100) NULL,
	[DT_DOB] [varchar](100) NULL,
	[SZ_POLICY_HOLDER] [varchar](500) NULL,
	[SZ_POLICY_NUMBER] [varchar](100) NULL,
	[SZ_CLAIM_NUMBER] [varchar](100) NULL,
	[SZ_INSURANCE_NAME] [varchar](500) NULL,
	[SZ_INSURANCE_ADDRESS] [varchar](1000) NULL,
	[SZ_INSURANCE_CITY] [varchar](100) NULL,
	[SZ_STATE] [varchar](100) NULL,
	[SZ_INSURANCE_ZIP] [varchar](100) NULL,
	[SZ_INSURANCE_EMAIL] [varchar](100) NULL,
	[SZ_STATUS_NAME] [varchar](100) NULL,
	[SZ_ATTORNEY_NAME] [varchar](500) NULL,
	[SZ_ATTORNEY_ADDRESS] [varchar](1000) NULL,
	[SZ_ATTORNEY_CITY] [varchar](100) NULL,
	[SZ_ATTORNEY_STATE] [varchar](100) NULL,
	[SZ_ATTORNEY_ZIP] [varchar](100) NULL,
	[SZ_ATTORNEY_FAX] [varchar](100) NULL,
	[SZ_PROVIDER] [varchar](1000) NULL,
	[SZ_BILL_NUMBER] [varchar](100) NULL,
	[DT_START_VISIT_DATE] [varchar](100) NULL,
	[DT_END_VISIT_DATE] [varchar](100) NULL,
	[FLT_BILL_AMOUNT] [varchar](100) NULL,
	[FLT_PAID] [varchar](100) NULL,
	[FLT_BALANCE] [varchar](100) NULL,
	[SZ_COMPANY_ID] [varchar](50) NULL,
	[SZ_OFFICE_ID] [varchar](50) NULL,
	[SZ_INSURANCE_ID] [varchar](50) NULL,
 CONSTRAINT [PK_TBLBILLING_DATA] PRIMARY KEY CLUSTERED 
(
	[BILLING_AUTO_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
