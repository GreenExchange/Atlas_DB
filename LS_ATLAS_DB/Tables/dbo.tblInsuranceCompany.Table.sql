USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[tblInsuranceCompany]    Script Date: 6/17/2019 2:22:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblInsuranceCompany](
	[InsuranceCompany_Id] [int] IDENTITY(1,1) NOT NULL,
	[InsuranceCompany_Name] [varchar](250) NULL,
	[InsuranceCompany_SuitName] [varchar](250) NULL,
	[InsuranceCompany_Type] [varchar](40) NULL,
	[InsuranceCompany_Local_Address] [varchar](250) NULL,
	[InsuranceCompany_Local_City] [varchar](100) NULL,
	[InsuranceCompany_Local_State] [varchar](100) NULL,
	[InsuranceCompany_Local_Zip] [varchar](100) NULL,
	[InsuranceCompany_Local_Phone] [varchar](100) NULL,
	[InsuranceCompany_Local_Fax] [varchar](100) NULL,
	[InsuranceCompany_Perm_Address] [varchar](250) NULL,
	[InsuranceCompany_Perm_City] [varchar](100) NULL,
	[InsuranceCompany_Perm_State] [varchar](100) NULL,
	[InsuranceCompany_Perm_Zip] [varchar](100) NULL,
	[InsuranceCompany_Perm_Phone] [varchar](100) NULL,
	[InsuranceCompany_Perm_Fax] [varchar](100) NULL,
	[InsuranceCompany_Contact] [varchar](255) NULL,
	[InsuranceCompany_Email] [varchar](100) NULL,
	[InsuranceCompany_GroupName] [varchar](200) NULL,
	[Active] [int] NULL,
	[SZ_SHORT_NAME] [nvarchar](100) NULL,
	[BILLING_ADDRESS] [varchar](100) NULL,
	[BILLING_CITY] [varchar](50) NULL,
	[BILLING_STATE] [varchar](2) NULL,
	[BILLING_ZIP] [varchar](10) NULL,
	[ActiveStatus] [bit] NULL,
	[InsuranceCompany_Initial_Address] [varchar](250) NULL,
	[InsuranceCompany_Initial_City] [varchar](100) NULL,
	[InsuranceCompany_Initial_State] [varchar](100) NULL,
	[InsuranceCompany_Initial_Zip] [varchar](100) NULL,
	[InsuranceCompany_Address2_Address] [nvarchar](100) NULL,
	[InsuranceCompany_Address2_City] [nvarchar](100) NULL,
	[InsuranceCompany_Address2_State] [nvarchar](100) NULL,
	[InsuranceCompany_Address2_Zip] [nvarchar](100) NULL,
	[InsuranceCompany_Address2_Phone] [nvarchar](100) NULL,
	[InsuranceCompany_Address2_Fax] [nvarchar](100) NULL,
	[gbb_status] [nvarchar](1000) NULL,
	[gbb_initial_status] [nvarchar](1000) NULL,
	[RCF_initial_status] [nvarchar](1000) NULL,
	[DomainId] [nvarchar](50) NOT NULL,
	[InsuranceCompanyGroup_ID] [int] NULL,
	[Served_Person_Name] [varchar](200) NULL,
	[Served_Date] [datetime] NULL,
	[Height] [nvarchar](50) NULL,
	[Weight] [nvarchar](50) NULL,
	[Age] [int] NULL,
	[Skin_Colour] [varchar](50) NULL,
	[Hair_Colour] [varchar](50) NULL,
	[Gender] [varchar](50) NULL,
	[InsuranceCompany_Local_County] [varchar](150) NULL,
	[InsuranceCompany_Address2_County] [varchar](150) NULL,
	[InsuranceCompany_Perm_County] [varchar](150) NULL,
	[InsuranceCompany_Initial_County] [varchar](150) NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblInsuranceCompany] ADD  CONSTRAINT [DF_tblInsuranceCompany_Active1]  DEFAULT ((2)) FOR [Active]
GO
ALTER TABLE [dbo].[tblInsuranceCompany] ADD  CONSTRAINT [DF_tblInsuranceCompany_ActiveStatus]  DEFAULT ((1)) FOR [ActiveStatus]
GO
ALTER TABLE [dbo].[tblInsuranceCompany] ADD  DEFAULT ('h1') FOR [DomainId]
GO
