USE [DKATLAS]
GO
/****** Object:  Table [dbo].[Data_2018_02_06_GYB_DK1]    Script Date: 6/17/2019 2:53:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Data_2018_02_06_GYB_DK1](
	[sz_case_id] [nvarchar](255) NULL,
	[sz_case_no] [nvarchar](255) NULL,
	[sz_patient_first_name] [nvarchar](255) NULL,
	[sz_patient_last_name] [nvarchar](255) NULL,
	[sz_insurance_name] [nvarchar](255) NULL,
	[sz_insurance_address] [nvarchar](255) NULL,
	[sz_insurance_city] [nvarchar](255) NULL,
	[sz_state] [nvarchar](255) NULL,
	[sz_insurance_zip] [nvarchar](255) NULL,
	[sz_insurance_phone] [nvarchar](255) NULL,
	[sz_insurance_email] [nvarchar](255) NULL,
	[sz_patient_address] [nvarchar](255) NULL,
	[sz_patient_street] [nvarchar](255) NULL,
	[sz_patient_city] [nvarchar](255) NULL,
	[sz_patient_state] [nvarchar](255) NULL,
	[sz_patient_zip] [nvarchar](255) NULL,
	[sz_patient_phone] [nvarchar](255) NULL,
	[sz_policy_number] [nvarchar](255) NULL,
	[sz_claim_number] [nvarchar](255) NULL,
	[sz_bill_status_name] [nvarchar](255) NULL,
	[sz_attorney_name] [nvarchar](255) NULL,
	[sz_attorney_last_name] [nvarchar](255) NULL,
	[sz_attorney_address] [nvarchar](255) NULL,
	[sz_attorney_city] [nvarchar](255) NULL,
	[sz_attorney_state] [nvarchar](255) NULL,
	[sz_attorney_zip] [nvarchar](255) NULL,
	[sz_attorney_fax] [nvarchar](255) NULL,
	[sz_social_security_no] [nvarchar](255) NULL,
	[dt_dob] [datetime] NULL,
	[sz_policy_holder] [nvarchar](255) NULL,
	[sz_bill_number] [nvarchar](255) NULL,
	[flt_bill_amount] [nvarchar](255) NULL,
	[flt_paid] [nvarchar](255) NULL,
	[flt_balance] [nvarchar](255) NULL,
	[dt_first_visit_date] [datetime] NULL,
	[dt_last_visit_date] [datetime] NULL,
	[sz_case_type_name] [nvarchar](255) NULL,
	[location] [nvarchar](255) NULL,
	[sz_company_id] [nvarchar](255) NULL,
	[Company_Name] [nvarchar](255) NULL,
	[provider_name] [nvarchar](255) NULL,
	[provider_address] [nvarchar](255) NULL,
	[provider_city] [nvarchar](255) NULL,
	[provider_zip] [nvarchar](255) NULL,
	[provider_state] [nvarchar](255) NULL,
	[dt_date_of_accident] [datetime] NULL,
	[verification] [nvarchar](255) NULL,
	[sz_assigned_lawfirm_id] [nvarchar](255) NULL,
	[transfer_amount] [nvarchar](255) NULL,
	[dt_date_of_transferred] [nvarchar](255) NULL,
	[bill_date] [datetime] NULL,
	[sz_provider_id] [nvarchar](255) NULL,
	[Provider_billing_address] [nvarchar](255) NULL,
	[Billing_Address_City] [nvarchar](255) NULL,
	[Billing_Address_Zip] [nvarchar](255) NULL,
	[Billing_Address_State] [nvarchar](255) NULL,
	[BillAmount] [nvarchar](255) NULL,
	[Piad] [nvarchar](255) NULL,
	[OutSatding] [nvarchar](255) NULL,
	[sz_insurancecompanyid] [nvarchar](255) NULL,
	[Denial_Date2] [nvarchar](255) NULL,
	[Denial_Reason2] [nvarchar](255) NULL,
	[Denial_Date3] [nvarchar](255) NULL,
	[Denial_Reason3] [nvarchar](255) NULL,
	[Denial_Date4] [nvarchar](255) NULL,
	[Denial_Reason4] [nvarchar](255) NULL
) ON [PRIMARY]
GO
