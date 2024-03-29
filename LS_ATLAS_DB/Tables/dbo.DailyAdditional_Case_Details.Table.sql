USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[DailyAdditional_Case_Details]    Script Date: 6/17/2019 2:22:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DailyAdditional_Case_Details](
	[Date_report_ran] [datetime] NULL,
	[portfolio] [nvarchar](50) NULL,
	[case_id] [nvarchar](100) NULL,
	[InsuredParty_FirstName] [nvarchar](100) NULL,
	[InsuredParty_LastName] [nvarchar](100) NULL,
	[InsuranceCompany_Name] [nvarchar](100) NULL,
	[CPT1] [nvarchar](100) NULL,
	[CPT2] [nvarchar](100) NULL,
	[CPT3] [nvarchar](100) NULL,
	[CPT4] [nvarchar](100) NULL,
	[MOD1] [nvarchar](100) NULL,
	[MOD2] [nvarchar](100) NULL,
	[MOD3] [nvarchar](100) NULL,
	[MOD4] [nvarchar](100) NULL,
	[DOS] [nvarchar](100) NULL,
	[Project_Code] [nvarchar](100) NULL,
	[Medical_Provider] [nvarchar](100) NULL,
	[Specialty] [nvarchar](100) NULL,
	[Bill_number] [nvarchar](100) NULL,
	[Patient_no_Medic] [nvarchar](100) NULL,
	[Accident_Date] [datetime] NULL,
	[DOCTOR_NAME] [nvarchar](100) NULL,
	[Units] [nvarchar](100) NULL,
	[ICD10_1] [nvarchar](100) NULL,
	[ICD10_2] [nvarchar](100) NULL,
	[ICD10_3] [nvarchar](100) NULL,
	[billing_date] [datetime] NULL,
	[bill_type] [nvarchar](100) NULL,
	[total_billed_amt] [nvarchar](100) NULL,
	[Bill_Adjustment] [nvarchar](100) NULL,
	[Purchase_Balance] [nvarchar](100) NULL,
	[Purchase_Price] [nvarchar](100) NULL,
	[Policy_Number] [nvarchar](100) NULL,
	[Note] [nvarchar](200) NULL,
	[First_Party_Case_Status] [nvarchar](100) NULL,
	[Case_Evaluation_Date] [datetime] NULL,
	[First_Party_Suit_Filed_Date] [nvarchar](100) NULL,
	[court_type] [nvarchar](100) NULL,
	[court_county] [nvarchar](100) NULL,
	[First_Party_Attorney] [nvarchar](100) NULL,
	[First_Party_LawFirm] [nvarchar](100) NULL,
	[Attorney_frmBiller_Note] [nvarchar](100) NULL,
	[Our_Attorney] [nvarchar](100) NULL,
	[Our_Attorney_Law_Firm] [nvarchar](100) NULL,
	[Law_Suit_Type] [nvarchar](100) NULL,
	[Purchase_Date] [datetime] NULL,
	[Settledby_First_Party_Litigation] [nvarchar](100) NULL,
	[Total_Litigation_Collection_1] [nvarchar](100) NULL,
	[Court_Fees_1] [nvarchar](100) NULL,
	[Litigation_Fees_1] [nvarchar](100) NULL,
	[Net_Litigation_Collection_1] [nvarchar](100) NULL,
	[Payment_no_1] [nvarchar](100) NULL,
	[Cheque_Date_1] [datetime] NULL,
	[Denied_Insurance_Company] [nvarchar](100) NULL,
	[Percentage_Collected] [nvarchar](100) NULL,
	[Current_Balance_per_patient] [nvarchar](100) NULL,
	[Aging_months_past_dos] [nvarchar](50) NULL,
	[domainid] [nvarchar](100) NULL
) ON [PRIMARY]
GO
