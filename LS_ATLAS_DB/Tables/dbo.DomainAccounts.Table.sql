USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[DomainAccounts]    Script Date: 6/17/2019 2:22:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DomainAccounts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DomainId] [varchar](100) NULL,
	[LawFirmName] [varchar](100) NULL,
	[CompanyType] [varchar](100) NULL,
	[LawFirmId] [varchar](100) NULL,
	[AccountDomain] [varchar](100) NULL,
	[EmailSendTo] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
