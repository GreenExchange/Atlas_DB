USE [DKATLAS]
GO
/****** Object:  Table [dbo].[tblBatchMailSend]    Script Date: 6/17/2019 2:53:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblBatchMailSend](
	[CASE_ID] [varchar](100) NULL,
	[MailSendDate] [datetime] NULL,
	[TYPE] [varchar](100) NULL
) ON [PRIMARY]
GO
