USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[tblProviderCase]    Script Date: 6/17/2019 2:22:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProviderCase](
	[Case_AutoId] [int] IDENTITY(12001,1) NOT NULL,
	[Case_Id] [nvarchar](50) NOT NULL,
	[Case_Code] [varchar](100) NULL,
	[Provider_Code] [varchar](100) NULL,
	[InsuranceCompany_Code] [varchar](100) NULL,
	[Provider_Id] [int] NULL,
	[InsuranceCompany_Id] [int] NULL,
	[ClaimantParty_LastName] [nvarchar](100) NULL,
	[ClaimantParty_FirstName] [nvarchar](100) NULL,
	[ClaimantParty_Address] [nvarchar](255) NULL,
	[ClaimantParty_City] [nvarchar](40) NULL,
	[ClaimantParty_State] [nvarchar](40) NULL,
	[ClaimantParty_Zip] [nvarchar](40) NULL,
	[ClaimantParty_Phone] [varchar](20) NULL,
	[ClaimantParty_Misc] [varchar](50) NULL,
	[InsuredParty_LastName] [nvarchar](100) NULL,
	[InsuredParty_FirstName] [nvarchar](100) NULL,
	[InsuredParty_Address] [nvarchar](255) NULL,
	[InsuredParty_City] [nvarchar](40) NULL,
	[InsuredParty_State] [nvarchar](40) NULL,
	[InsuredParty_Zip] [nvarchar](40) NULL,
	[InsuredParty_Misc] [varchar](50) NULL,
	[Incident_Date] [datetime] NULL,
	[Incident_Address] [nvarchar](255) NULL,
	[Incident_City] [nvarchar](40) NULL,
	[Incident_State] [nvarchar](40) NULL,
	[Incident_Zip] [nvarchar](40) NULL,
	[Policy_Number] [varchar](40) NULL,
	[Ins_Claim_Number] [nvarchar](50) NULL,
	[Old_Status] [nvarchar](50) NULL,
	[Defendant_Id] [nvarchar](50) NULL,
	[Date_Opened] [datetime] NULL,
	[Date_Opened_Full] [datetime] NULL,
	[Last_Status] [varchar](50) NULL,
	[Memo] [nvarchar](255) NULL,
	[ClaimantParty_Type] [nvarchar](20) NULL,
	[InsuredParty_Type] [nvarchar](20) NULL,
	[Adjuster_Id] [int] NULL,
	[DenialReasons_Type] [nvarchar](50) NULL,
	[Attorney_FileNumber] [nvarchar](100) NULL,
	[Group_Data] [int] NULL,
	[Group_Id] [int] NULL,
	[Date_Status_Changed] [datetime] NULL,
	[Date_Answer_Received] [datetime] NULL,
	[Motion_Date] [datetime] NULL,
	[Trial_Date] [char](50) NULL,
	[Attorney_Id] [varchar](50) NULL,
	[Date_Answer_Expected] [datetime] NULL,
	[Reply_Date] [datetime] NULL,
	[Calendar_Part] [varchar](50) NULL,
	[Motion_Type] [varchar](100) NULL,
	[Whose_Motion] [varchar](50) NULL,
	[Defense_Opp_Due] [datetime] NULL,
	[Date_Ext_Of_Time_2] [datetime] NULL,
	[XMotion_Type] [varchar](50) NULL,
	[Case_Billing] [float] NULL,
	[DateOfService_Start] [datetime] NULL,
	[DateOfService_End] [datetime] NULL,
	[Claim_Amount] [varchar](100) NULL,
	[Paid_Amount] [varchar](100) NULL,
	[Date_BillSent] [varchar](250) NULL,
	[Caption] [nvarchar](1000) NULL,
	[Group_ClaimAmt] [nvarchar](200) NULL,
	[Group_PaidAmt] [nvarchar](200) NULL,
	[Group_Balance] [nvarchar](200) NULL,
	[Group_InsClaimNo] [nvarchar](200) NULL,
	[Group_All] [nvarchar](500) NULL,
	[Date_Packeted] [datetime] NULL,
	[Group_Incident] [nvarchar](200) NULL,
	[Group_PolicyNum] [nvarchar](200) NULL,
	[GROUP_CASE_SEQUENCE] [int] NULL,
	[Our_SJ_Motion_Activity] [nvarchar](100) NULL,
	[Their_SJ_Motion_Activity] [nvarchar](100) NULL,
	[Our_Discovery_Demands] [nvarchar](100) NULL,
	[Our_Discovery_Responses] [nvarchar](100) NULL,
	[Date_Summons_Printed] [datetime] NULL,
	[Plaintiff_Discovery_Due_Date] [datetime] NULL,
	[Defendant_Discovery_Due_Date] [datetime] NULL,
	[Date_Bill_Submitted] [datetime] NULL,
	[Date_Index_Number_Purchased] [datetime] NULL,
	[Date_Afidavit_Filed] [datetime] NULL,
	[Date_Ext_Of_Time] [datetime] NULL,
	[Date_Summons_Sent_Court] [datetime] NULL,
	[Date_Ext_Of_Time_3] [datetime] NULL,
	[Served_To] [varchar](100) NULL,
	[Served_On_Date] [datetime] NULL,
	[Served_On_Time] [varchar](50) NULL,
	[Date_Closed] [datetime] NULL,
	[Notary_id] [int] NULL,
	[stips_signed_and_returned] [bit] NULL,
	[stips_signed_and_returned_2] [bit] NULL,
	[stips_signed_and_returned_3] [bit] NULL,
	[Date_Demands_Printed] [datetime] NULL,
	[Date_Disc_Conf_Letter_Printed] [datetime] NULL,
	[Date_Reply_To_Disc_Conf_Letter_Recd] [datetime] NULL,
	[psid] [int] NULL,
	[Motion_Status] [varchar](50) NULL,
	[BX_Originated] [bit] NULL,
	[BX_TEMP_ID] [varchar](50) NULL,
	[Date_AAA_Arb_Filed] [datetime] NULL,
	[Date_AAA_Concilation_Over] [datetime] NULL,
	[Arbitrator_ID] [int] NULL,
	[AAA_Confirmed_Date] [datetime] NULL,
	[userId] [nvarchar](100) NULL,
	[Doctor_id] [int] NULL,
	[batchcode] [nvarchar](50) NULL,
	[location_id] [int] NULL,
	[GBDocument_RelativePath] [varchar](max) NULL,
	[GBDocument_AbsolutePath] [varchar](max) NULL,
	[Claimant_LAST_BKP] [varchar](500) NULL,
	[Bit_FromGB] [int] NULL,
	[Claimant_Caption] [varchar](8000) NULL,
	[Provider_Caption] [varchar](8000) NULL,
	[AAA_Decisions] [varchar](800) NULL,
	[GB_Dms_Link] [varchar](800) NULL,
	[GB_CASE_ID] [nvarchar](500) NULL,
	[GB_COMPANY_ID] [nvarchar](500) NULL,
	[GB_CASE_NO] [nvarchar](500) NULL,
	[DateNotice_TrialFiled] [datetime] NULL,
	[DateFile_Trial_DeNovo] [datetime] NULL,
	[DateAAA_packagePrinting] [datetime] NULL,
	[DateAAA_ResponceRecieved] [datetime] NULL,
	[Fee_Schedule] [numeric](18, 2) NULL,
	[Representetive] [nvarchar](500) NULL,
	[Representative_Contact_Number] [nvarchar](500) NULL,
	[Denial_Date] [datetime] NULL,
	[INSURANCECOMPANY_INITIAL_ADDRESS] [nvarchar](2000) NULL,
	[DOSHI_CASE_ID] [int] NULL,
	[OPENED_BY] [nvarchar](50) NULL,
	[Assigned_Attorney] [varchar](100) NULL,
	[Caseid_no] [int] NULL,
	[Date_Open_Verification_Response_Sent1] [datetime] NULL,
	[Date_Open_Verification_Response_Sent2] [datetime] NULL,
	[Date_of_AAA_Awards] [datetime] NULL,
	[Date_NAM_ARB_Filed] [datetime] NULL,
	[Date_NAM_Confirmed] [datetime] NULL,
	[Date_NAM_Response_Received] [datetime] NULL,
	[Date_of_NAM_Awards] [datetime] NULL,
	[Date_NAM_Package_Printed] [datetime] NULL,
	[fhkp_status] [varchar](1000) NULL,
	[firm_split_percent] [numeric](18, 2) NULL,
	[old_Case_id] [varchar](100) NULL,
	[DomainId] [nvarchar](50) NULL,
	[FK_Packet_ID] [int] NULL,
	[PortfolioId] [int] NULL,
	[AttorneyFirmId] [int] NULL,
	[PurchaseDate] [datetime] NULL,
	[Status] [nvarchar](50) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblProviderCase] ADD  CONSTRAINT [DF_tblcase_Date_Opened_Full1]  DEFAULT (getdate()) FOR [Date_Opened_Full]
GO
ALTER TABLE [dbo].[tblProviderCase] ADD  CONSTRAINT [DF_tblcase_Date_Status_Changed1]  DEFAULT (getdate()) FOR [Date_Status_Changed]
GO
ALTER TABLE [dbo].[tblProviderCase] ADD  CONSTRAINT [DF_tblcase_BX_Originated1]  DEFAULT ((0)) FOR [BX_Originated]
GO
ALTER TABLE [dbo].[tblProviderCase] ADD  CONSTRAINT [DF__tblcase__DomainI__29E1370A1]  DEFAULT ('h1') FOR [DomainId]
GO
