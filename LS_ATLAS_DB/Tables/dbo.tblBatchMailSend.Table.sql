USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[tblBatchMailSend]    Script Date: 6/17/2019 2:22:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblBatchMailSend](
	[CASE_ID] [varchar](100) NULL,
	[MailSendDate] [datetime] NULL,
	[TYPE] [varchar](100) NULL,
	[DomainId] [nvarchar](512) NOT NULL,
	[BatchCode] [nvarchar](50) NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblBatchMailSend] ADD  DEFAULT ('h1') FOR [DomainId]
GO
