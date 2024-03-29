USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[tblClient]    Script Date: 6/17/2019 2:22:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblClient](
	[Client_AutoId] [int] IDENTITY(1,1) NOT NULL,
	[Client_Id] [nvarchar](50) NOT NULL,
	[Client_Name] [nvarchar](100) NOT NULL,
	[Client_Type] [varchar](40) NULL,
	[Client_Local_Address] [varchar](255) NULL,
	[Client_Local_City] [varchar](100) NULL,
	[Client_Local_State] [varchar](100) NULL,
	[Client_Local_Zip] [varchar](50) NULL,
	[Client_Local_Phone] [varchar](100) NULL,
	[Client_Local_Fax] [varchar](100) NULL,
	[Client_Contact] [varchar](100) NULL,
	[Client_Perm_Address] [varchar](255) NULL,
	[Client_Perm_City] [varchar](100) NULL,
	[Client_Perm_State] [varchar](100) NULL,
	[Client_Perm_Zip] [varchar](50) NULL,
	[Client_Perm_Phone] [varchar](100) NULL,
	[Client_Perm_Fax] [varchar](100) NULL,
	[Client_Email] [varchar](100) NULL,
	[DomainId] [nvarchar](512) NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblClient] ADD  DEFAULT ('h1') FOR [DomainId]
GO
