USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[XN_TEMP_TABLE_GBB_DATA_GoGYB_ALL]    Script Date: 6/17/2019 2:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[XN_TEMP_TABLE_GBB_DATA_GoGYB_ALL](
	[autoid] [int] IDENTITY(1,1) NOT NULL,
	[SZ_CASE_ID] [int] NULL,
	[SZ_CASE_NO] [int] NULL,
	[SZ_PATIENT_FIRST_NAME] [nvarchar](1000) NULL,
	[SZ_PATIENT_LAST_NAME] [nvarchar](1000) NULL,
	[SZ_INSURANCE_NAME] [nvarchar](1000) NULL,
	[SZ_INSURANCE_ADDRESS] [nvarchar](1000) NULL,
	[SZ_INSURANCE_CITY] [nvarchar](100) NULL,
	[SZ_STATE] [nvarchar](100) NULL,
	[SZ_INSURANCE_ZIP] [nvarchar](100) NULL,
	[SZ_INSURANCE_PHONE] [nvarchar](1000) NULL,
	[SZ_INSURANCE_EMAIL] [nvarchar](1000) NULL,
	[SZ_PATIENT_ADDRESS] [nvarchar](1000) NULL,
	[SZ_PATIENT_STREET] [nvarchar](1000) NULL,
	[SZ_PATIENT_CITY] [nvarchar](1000) NULL,
	[SZ_PATIENT_STATE] [nvarchar](1000) NULL,
	[SZ_PATIENT_ZIP] [nvarchar](1000) NULL,
	[SZ_PATIENT_PHONE] [nvarchar](1000) NULL,
	[SZ_POLICY_NUMBER] [nvarchar](1000) NULL,
	[SZ_CLAIM_NUMBER] [nvarchar](1000) NULL,
	[SZ_BILL_STATUS_NAME] [nvarchar](1000) NULL,
	[SZ_ATTORNEY_NAME] [nvarchar](1000) NULL,
	[SZ_ATTORNEY_LAST_NAME] [nvarchar](1000) NULL,
	[SZ_ATTORNEY_ADDRESS] [nvarchar](1000) NULL,
	[SZ_ATTORNEY_CITY] [nvarchar](1000) NULL,
	[SZ_ATTORNEY_STATE] [nvarchar](1000) NULL,
	[SZ_ATTORNEY_ZIP] [nvarchar](1000) NULL,
	[SZ_ATTORNEY_FAX] [nvarchar](1000) NULL,
	[SZ_SOCIAL_SECURITY_NO] [nvarchar](1000) NULL,
	[DT_DOB] [datetime] NULL,
	[SZ_POLICY_HOLDER] [nvarchar](1000) NULL,
	[SZ_BILL_NUMBER] [nvarchar](100) NULL,
	[FLT_BILL_AMOUNT] [float] NULL,
	[FLT_PAID] [float] NULL,
	[FLT_BALANCE] [nvarchar](1000) NULL,
	[DT_FIRST_VISIT_DATE] [datetime] NULL,
	[DT_LAST_VISIT_DATE] [datetime] NULL,
	[SZ_CASE_TYPE_NAME] [nvarchar](1000) NULL,
	[Location] [nvarchar](1000) NULL,
	[SZ_COMPANY_ID] [nvarchar](1000) NULL,
	[Company_Name] [nvarchar](1000) NULL,
	[Provider_Name] [nvarchar](1000) NULL,
	[PROVIDER_ADDRESS] [nvarchar](100) NULL,
	[PROVIDER_CITY] [nvarchar](100) NULL,
	[PROVIDER_ZIP] [nvarchar](100) NULL,
	[PROVIDER_STATE] [nvarchar](100) NULL,
	[DT_DATE_OF_ACCIDENT] [datetime] NULL,
	[Verification] [nvarchar](2000) NULL,
	[AssignLaw_firm] [nvarchar](500) NULL,
	[Transfer_Amount] [nvarchar](500) NULL,
	[DT_DATE_OF_TRANSFERRED] [datetime] NULL,
	[BILL_DATE] [datetime] NULL,
	[GB_provider_id] [nvarchar](50) NULL,
	[GB_insurancecompanyid] [nvarchar](50) NULL,
	[Denial_Date1] [datetime] NULL,
	[Denial_Reason1] [nvarchar](500) NULL,
	[Denial_Date2] [datetime] NULL,
	[Denial_Reason2] [nvarchar](500) NULL,
	[Denial_Date3] [datetime] NULL,
	[Denial_Reason3] [nvarchar](500) NULL,
	[Denial_Date4] [datetime] NULL,
	[Denial_Reason4] [nvarchar](500) NULL,
	[Provider_ID] [nvarchar](100) NULL,
	[InsuranceCompanyId] [nvarchar](100) NULL,
	[Status_Done] [nvarchar](50) NULL,
	[New_Status] [varchar](100) NULL,
	[DomainId] [nvarchar](50) NULL,
	[IndexOrAAA_Number] [varchar](40) NULL,
	[Settled_Awarded] [float] NULL,
	[HEARING_DATE_TIME] [nvarchar](250) NULL,
	[Attorney_Fee] [float] NULL,
	[Filing_Fee] [float] NULL,
	[Date_Closed] [datetime] NULL,
	[STATUS] [nvarchar](250) NULL,
	[old_Case_id] [varchar](100) NULL
) ON [PRIMARY]
GO
