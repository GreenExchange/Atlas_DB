USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[tblEmail]    Script Date: 6/17/2019 2:22:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEmail](
	[Email_Id] [int] IDENTITY(1,1) NOT NULL,
	[Email_Desc] [nvarchar](500) NULL,
	[Case_Id] [nvarchar](100) NULL,
	[User_Id] [nvarchar](100) NULL,
	[Message_Id] [varchar](8000) NULL,
	[UID] [varchar](8000) NULL,
	[Message_Date] [datetime] NOT NULL,
	[Subject] [nvarchar](100) NULL,
	[Headers] [nvarchar](500) NULL,
	[Body] [nvarchar](4000) NULL,
	[Html] [varchar](8000) NULL,
	[Message_To] [varchar](8000) NOT NULL,
	[Message_From] [varchar](8000) NOT NULL,
	[Message_FromName] [varchar](8000) NULL,
	[Message_FromIP] [varchar](8000) NULL,
	[Message_CC] [varchar](8000) NULL,
	[Message_BCC] [varchar](8000) NULL,
	[Message_ReplyTo] [varchar](8000) NULL,
	[Attachments] [varchar](8000) NULL,
	[MIMEText] [varchar](8000) NULL,
	[ReturnPath] [varchar](8000) NULL,
	[Date_Created] [datetime] NOT NULL,
	[Attachment_Files] [varchar](8000) NULL,
	[DomainId] [nvarchar](512) NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblEmail] ADD  DEFAULT ('h1') FOR [DomainId]
GO
