USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[tblreportsettlement]    Script Date: 6/17/2019 2:22:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblreportsettlement](
	[case_id] [nvarchar](50) NULL,
	[sett_tot] [money] NULL,
	[Provider_Name] [nvarchar](100) NULL,
	[InsuranceCompany_Name] [nvarchar](100) NULL,
	[InjuredParty_Name] [nvarchar](100) NULL,
	[Claim_Amount] [money] NULL,
	[User_Id] [nvarchar](100) NULL,
	[Settlement_Amount] [money] NULL,
	[Settlement_Int] [money] NULL,
	[Settlement_Af] [money] NULL,
	[Settlement_Ff] [money] NULL,
	[Settlement_Date] [datetime] NULL,
	[Settlement_Notes] [nvarchar](2000) NULL,
	[Provider_Id] [nvarchar](20) NULL,
	[Settlement_Total] [money] NULL,
	[Paid_amount] [money] NULL,
	[Date_Opened] [datetime] NULL,
	[InsuranceCompany_Id] [nvarchar](20) NULL,
	[DOS] [nvarchar](200) NULL,
	[Fee_Schedule] [money] NULL,
	[DomainId] [nvarchar](512) NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblreportsettlement] ADD  DEFAULT ('h1') FOR [DomainId]
GO
