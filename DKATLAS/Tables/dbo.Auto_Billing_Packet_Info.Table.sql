USE [DKATLAS]
GO
/****** Object:  Table [dbo].[Auto_Billing_Packet_Info]    Script Date: 6/17/2019 2:53:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Auto_Billing_Packet_Info](
	[Case_Id] [varchar](100) NOT NULL,
	[Case_AutoId] [varchar](100) NULL,
	[Case_Code] [varchar](100) NULL,
	[Packeted_Case_ID] [varchar](200) NULL,
	[InjuredParty_LastName] [varchar](200) NULL,
	[InjuredParty_FirstName] [varchar](200) NULL,
	[InsuredParty_LastName] [varchar](200) NULL,
	[InsuredParty_FirstName] [varchar](200) NULL,
	[Provider_Name] [varchar](1000) NULL,
	[InsuranceCompany_Name] [varchar](100) NULL,
	[Claim_Amount] [money] NULL,
	[Claim_Balance] [money] NULL,
	[Paid_Amount] [money] NULL,
	[Fee_Schedule] [money] NULL,
	[FS_Balance] [money] NULL,
	[Status] [varchar](500) NULL,
	[Initial_Status] [varchar](500) NULL,
	[Accident_Date] [datetime] NULL,
	[Ins_Claim_Number] [varchar](100) NULL,
	[Policy_Number] [varchar](100) NULL,
	[Provider_GroupName] [varchar](500) NULL,
	[Status_Age] [int] NULL,
	[DateOfService_Start] [datetime] NULL,
	[DateOfService_End] [datetime] NULL,
	[Date_BillSent] [datetime] NULL,
	[DenialReasons_Type] [varchar](2000) NULL,
	[ServiceType] [varchar](500) NULL,
	[Provider_Id] [int] NULL,
	[InsuranceCompany_Id] [int] NULL,
	[Date_Opened] [datetime] NULL,
	[Date_Status_Changed] [datetime] NULL,
	[packet_type] [varchar](100) NULL,
 CONSTRAINT [PK_Auto_Billing_Packet_Info] PRIMARY KEY CLUSTERED 
(
	[Case_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
