USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[tblArbitrationCases]    Script Date: 6/17/2019 2:22:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblArbitrationCases](
	[Case_Id] [nvarchar](50) NULL,
	[ready_date] [datetime] NULL,
	[printed_date] [datetime] NULL,
	[ready_by_user] [nvarchar](10) NULL,
	[AutoId] [int] IDENTITY(1,1) NOT NULL,
	[MailSendDate] [datetime] NULL,
	[DomainId] [nvarchar](512) NOT NULL,
	[BatchCode] [nvarchar](50) NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblArbitrationCases] ADD  DEFAULT ('h1') FOR [DomainId]
GO
