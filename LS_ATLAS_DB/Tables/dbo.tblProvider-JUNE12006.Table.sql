USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[tblProvider-JUNE12006]    Script Date: 6/17/2019 2:22:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProvider-JUNE12006](
	[Provider_Id] [int] NOT NULL,
	[Provider_Code] [nvarchar](100) NULL,
	[Provider_Name] [nvarchar](100) NULL,
	[Provider_Type] [varchar](40) NULL,
	[Provider_Local_Address] [varchar](255) NULL,
	[Provider_Local_City] [varchar](100) NULL,
	[Provider_Local_State] [varchar](100) NULL,
	[Provider_Local_Zip] [varchar](50) NULL,
	[Provider_Local_Phone] [varchar](100) NULL,
	[Provider_Local_Fax] [varchar](100) NULL,
	[Provider_Contact] [varchar](100) NULL,
	[Provider_Perm_Address] [varchar](255) NULL,
	[Provider_Perm_City] [varchar](100) NULL,
	[Provider_Perm_State] [varchar](100) NULL,
	[Provider_Perm_Zip] [varchar](50) NULL,
	[Provider_Perm_Phone] [varchar](100) NULL,
	[Provider_Perm_Fax] [varchar](100) NULL,
	[Provider_Email] [varchar](100) NULL,
	[Provider_Billing] [float] NULL,
	[Provider_Contact2] [varchar](100) NULL,
	[Provider_IntBilling] [varchar](10) NULL,
	[Invoice_Type] [varchar](10) NULL,
	[cost_balance] [money] NULL,
	[Provider_Notes] [nvarchar](1000) NULL,
	[Provider_ReferredBy] [nvarchar](100) NULL,
	[DomainId] [nvarchar](512) NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblProvider-JUNE12006] ADD  DEFAULT ('h1') FOR [DomainId]
GO
