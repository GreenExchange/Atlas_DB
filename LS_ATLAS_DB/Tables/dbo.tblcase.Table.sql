USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[tblcase]    Script Date: 6/17/2019 2:22:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblcase](
	[Case_AutoId] [int] IDENTITY(12001,1) NOT NULL,
	[Case_Id] [varchar](50) NOT NULL,
	[Case_Code] [varchar](100) NULL,
	[Provider_Code] [varchar](100) NULL,
	[InsuranceCompany_Code] [varchar](100) NULL,
	[Provider_Id] [int] NULL,
	[InsuranceCompany_Id] [int] NULL,
	[InjuredParty_LastName] [varchar](100) NULL,
	[InjuredParty_FirstName] [varchar](100) NULL,
	[InjuredParty_Address] [varchar](255) NULL,
	[InjuredParty_City] [varchar](50) NULL,
	[InjuredParty_State] [varchar](50) NULL,
	[InjuredParty_Zip] [varchar](50) NULL,
	[InjuredParty_Phone] [varchar](100) NULL,
	[InjuredParty_Misc] [varchar](50) NULL,
	[InsuredParty_LastName] [varchar](100) NULL,
	[InsuredParty_FirstName] [varchar](100) NULL,
	[InsuredParty_Address] [varchar](255) NULL,
	[InsuredParty_City] [varchar](50) NULL,
	[InsuredParty_State] [varchar](50) NULL,
	[InsuredParty_Zip] [varchar](50) NULL,
	[InsuredParty_Misc] [varchar](50) NULL,
	[Accident_Date] [datetime] NULL,
	[Accident_Address] [nvarchar](255) NULL,
	[Accident_City] [nvarchar](40) NULL,
	[Accident_State] [nvarchar](40) NULL,
	[Accident_Zip] [nvarchar](40) NULL,
	[Policy_Number] [varchar](40) NULL,
	[Ins_Claim_Number] [nvarchar](50) NULL,
	[IndexOrAAA_Number] [varchar](40) NULL,
	[Status] [varchar](50) NULL,
	[Old_Status] [varchar](50) NULL,
	[Defendant_Id] [varchar](50) NULL,
	[Date_Opened] [datetime] NULL,
	[Date_Opened_Full] [datetime] NULL,
	[Last_Status] [varchar](50) NULL,
	[Initial_Status] [varchar](50) NULL,
	[Memo] [varchar](255) NULL,
	[InjuredParty_Type] [varchar](50) NULL,
	[InsuredParty_Type] [varchar](50) NULL,
	[Adjuster_Id] [int] NULL,
	[DenialReasons_Type] [varchar](2000) NULL,
	[Court_Id] [int] NULL,
	[Attorney_FileNumber] [varchar](100) NULL,
	[Group_Data] [int] NULL,
	[Group_Id] [int] NULL,
	[Date_Status_Changed] [datetime] NULL,
	[Motion_Date] [datetime] NULL,
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
	[Claim_Amount] [float] NULL,
	[Paid_Amount] [float] NULL,
	[Date_BillSent] [datetime] NULL,
	[Caption] [varchar](1000) NULL,
	[Group_ClaimAmt] [float] NULL,
	[Group_PaidAmt] [float] NULL,
	[Group_Balance] [float] NULL,
	[Group_InsClaimNo] [varchar](200) NULL,
	[Group_All] [varchar](500) NULL,
	[Date_Packeted] [datetime] NULL,
	[Group_Accident] [varchar](200) NULL,
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
	[INJURED_LAST_BKP] [varchar](500) NULL,
	[Bit_FromGB] [int] NULL,
	[Injured_Caption] [varchar](8000) NULL,
	[Provider_Caption] [varchar](8000) NULL,
	[AAA_Decisions] [varchar](800) NULL,
	[GB_Dms_Link] [varchar](800) NULL,
	[GB_CASE_ID] [varchar](500) NULL,
	[GB_COMPANY_ID] [varchar](500) NULL,
	[GB_CASE_NO] [varchar](500) NULL,
	[DateNotice_TrialFiled] [datetime] NULL,
	[DateFile_Trial_DeNovo] [datetime] NULL,
	[DateAAA_packagePrinting] [datetime] NULL,
	[DateAAA_ResponceRecieved] [datetime] NULL,
	[Fee_Schedule] [float] NULL,
	[Representetive] [nvarchar](500) NULL,
	[Representative_Contact_Number] [varchar](500) NULL,
	[Denial_Date] [datetime] NULL,
	[INSURANCECOMPANY_INITIAL_ADDRESS] [varchar](2000) NULL,
	[DOSHI_CASE_ID] [int] NULL,
	[OPENED_BY] [varchar](50) NULL,
	[Assigned_Attorney] [int] NULL,
	[Caseid_no] [int] NULL,
	[Date_of_AAA_Awards] [datetime] NULL,
	[Date_NAM_ARB_Filed] [datetime] NULL,
	[Date_NAM_Confirmed] [datetime] NULL,
	[Date_NAM_Response_Received] [datetime] NULL,
	[Date_of_NAM_Awards] [datetime] NULL,
	[Date_NAM_Package_Printed] [datetime] NULL,
	[fhkp_status] [varchar](1000) NULL,
	[firm_split_percent] [numeric](18, 2) NULL,
	[old_Case_id] [varchar](100) NULL,
	[DomainId] [varchar](50) NULL,
	[FK_Packet_ID] [int] NULL,
	[purchaseDate] [datetime] NULL,
	[PortfolioId] [int] NULL,
	[AttorneyFirmId] [int] NULL,
	[FIRST_PARTY_SUIT_DATE] [datetime] NULL,
	[gbb_type] [varchar](10) NULL,
	[GB_LawFirm_ID] [varchar](100) NULL,
	[IsDuplicateCase] [int] NULL,
	[Rebuttal_Status] [varchar](200) NULL,
	[original_status] [varchar](50) NULL,
	[Date_Rebuttal_Status_Changed] [datetime] NULL,
	[StatusDisposition] [varchar](1000) NULL,
	[WriteOff] [float] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblcase] ADD  CONSTRAINT [DF_tblcase_Date_Opened_Full]  DEFAULT (getdate()) FOR [Date_Opened_Full]
GO
ALTER TABLE [dbo].[tblcase] ADD  CONSTRAINT [DF_tblcase_Date_Status_Changed]  DEFAULT (getdate()) FOR [Date_Status_Changed]
GO
ALTER TABLE [dbo].[tblcase] ADD  CONSTRAINT [DF_tblcase_BX_Originated]  DEFAULT ((0)) FOR [BX_Originated]
GO
ALTER TABLE [dbo].[tblcase] ADD  CONSTRAINT [DF__tblcase__DomainI__29E1370A]  DEFAULT ('h1') FOR [DomainId]
GO
