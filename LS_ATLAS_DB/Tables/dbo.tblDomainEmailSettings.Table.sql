USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[tblDomainEmailSettings]    Script Date: 6/17/2019 2:22:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDomainEmailSettings](
	[pk_domain_email_id] [int] IDENTITY(1,1) NOT NULL,
	[Domain_Id] [varchar](50) NOT NULL,
	[EmailFrom] [varchar](max) NOT NULL,
	[Password] [varchar](max) NOT NULL,
	[SMTP_Port_Number] [int] NOT NULL,
	[SMTP_Server_Name] [varchar](max) NOT NULL,
	[isSSLEnabled] [bit] NOT NULL,
	[ReplyToEmailId] [varchar](max) NULL,
 CONSTRAINT [PK_tblDomainEmailSettings] PRIMARY KEY CLUSTERED 
(
	[pk_domain_email_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
