USE [DKATLAS]
GO
/****** Object:  Table [dbo].[01_15_2018_DK]    Script Date: 6/17/2019 2:53:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[01_15_2018_DK](
	[sz_case_id] [float] NULL,
	[sz_case_no] [float] NULL,
	[sz_patient_first_name] [nvarchar](255) NULL,
	[sz_patient_last_name] [nvarchar](255) NULL,
	[sz_insurance_name] [nvarchar](255) NULL,
	[sz_insurance_address] [nvarchar](255) NULL,
	[sz_insurance_city] [nvarchar](255) NULL,
	[sz_state] [nvarchar](255) NULL,
	[sz_insurance_zip] [nvarchar](255) NULL,
	[sz_insurance_phone] [nvarchar](255) NULL,
	[sz_patient_address] [nvarchar](255) NULL,
	[sz_patient_street] [nvarchar](255) NULL,
	[sz_patient_city] [nvarchar](255) NULL,
	[sz_patient_state] [nvarchar](255) NULL,
	[sz_patient_zip] [float] NULL,
	[sz_patient_phone] [nvarchar](255) NULL,
	[sz_policy_number] [nvarchar](255) NULL,
	[sz_claim_number] [nvarchar](255) NULL,
	[sz_bill_status_name] [nvarchar](255) NULL,
	[sz_attorney_name] [nvarchar](255) NULL,
	[sz_attorney_address] [nvarchar](255) NULL,
	[sz_attorney_city] [nvarchar](255) NULL,
	[sz_attorney_zip] [float] NULL,
	[sz_social_security_no] [nvarchar](255) NULL,
	[dt_dob] [datetime] NULL,
	[sz_policy_holder] [nvarchar](255) NULL,
	[sz_bill_number] [nvarchar](255) NULL,
	[flt_bill_amount] [float] NULL,
	[flt_balance] [float] NULL,
	[dt_first_visit_date] [datetime] NULL,
	[dt_last_visit_date] [datetime] NULL,
	[sz_case_type_name] [nvarchar](255) NULL,
	[sz_company_id] [nvarchar](255) NULL,
	[Company_Name] [nvarchar](255) NULL,
	[provider_name] [nvarchar](255) NULL,
	[provider_address] [nvarchar](255) NULL,
	[provider_city] [nvarchar](255) NULL,
	[provider_zip] [float] NULL,
	[provider_state] [nvarchar](255) NULL,
	[Provider tax id] [nvarchar](255) NULL,
	[Doctor tax id] [nvarchar](255) NULL,
	[dt_date_of_accident] [datetime] NULL,
	[sz_assigned_lawfirm_id] [nvarchar](255) NULL,
	[transfer_amount] [float] NULL,
	[dt_date_of_transferred] [nvarchar](255) NULL,
	[bill_date] [datetime] NULL,
	[sz_provider_id] [nvarchar](255) NULL,
	[Provider_billing_address] [nvarchar](255) NULL,
	[BillAmount] [float] NULL,
	[Piad] [float] NULL,
	[OutSatding] [float] NULL,
	[sz_insurancecompanyid] [nvarchar](255) NULL,
	[sz_attorney_state] [nvarchar](255) NULL,
	[sz_attorney_fax] [nvarchar](255) NULL,
	[flt_paid] [float] NULL,
	[verification] [nvarchar](255) NULL,
	[sz_attorney_last_name] [nvarchar](255) NULL,
	[Denial_Date1] [datetime] NULL,
	[Denial_Reason1] [nvarchar](255) NULL,
	[Denial_Date2] [nvarchar](255) NULL,
	[Denial_Reason2] [nvarchar](255) NULL,
	[Denial_Date3] [nvarchar](255) NULL,
	[Denial_Reason3] [nvarchar](255) NULL,
	[Denial_Date4] [nvarchar](255) NULL,
	[Denial_Reason4] [nvarchar](255) NULL
) ON [PRIMARY]
GO
