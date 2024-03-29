USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[Email_Server]    Script Date: 6/17/2019 2:22:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Email_Server](
	[AutoID] [int] IDENTITY(1,1) NOT NULL,
	[DomainID] [varchar](100) NULL,
	[from_email_id] [varchar](100) NULL,
	[password] [varchar](100) NULL,
	[smtp_server] [varchar](50) NULL,
	[smtp_port] [int] NULL,
	[type] [varchar](150) NULL,
	[CC] [varchar](100) NULL,
	[BCC] [varchar](100) NULL,
	[mail_subject] [varchar](300) NULL,
	[mail_body] [varchar](4000) NULL,
	[to_email_id] [varchar](500) NULL,
	[status] [varchar](200) NULL,
	[node_id] [int] NULL
) ON [PRIMARY]
GO
