USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[tbl_Client]    Script Date: 6/17/2019 2:22:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Client](
	[Auto_ID] [int] IDENTITY(1,1) NOT NULL,
	[DomainId] [varchar](20) NOT NULL,
	[LawFirmName] [varchar](200) NULL,
	[CompanyType] [varchar](50) NOT NULL,
	[Client_Billing_Address] [varchar](255) NULL,
	[Client_Billing_City] [varchar](100) NULL,
	[Client_Billing_State] [varchar](100) NULL,
	[Client_Billing_Zip] [varchar](50) NULL,
	[Client_Billing_Phone] [varchar](100) NULL,
	[Client_Billing_Fax] [varchar](100) NULL,
	[Client_Contact] [varchar](100) NULL,
	[Client_Email] [varchar](100) NULL,
	[Client_First_Name] [varchar](100) NULL,
	[Client_Last_Name] [varchar](100) NULL,
	[client_header] [varchar](1000) NULL,
PRIMARY KEY CLUSTERED 
(
	[DomainId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tbl_Client] ADD  DEFAULT ('attorney') FOR [CompanyType]
GO
