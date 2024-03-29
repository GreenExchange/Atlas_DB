USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[tblEmailSend_Info]    Script Date: 6/17/2019 2:22:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEmailSend_Info](
	[AutoID] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](50) NULL,
	[Case_ID] [nvarchar](50) NULL,
	[EmailID] [nvarchar](50) NULL,
	[Send_Status] [nvarchar](50) NULL,
	[DomainId] [nvarchar](512) NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblEmailSend_Info] ADD  DEFAULT ('h1') FOR [DomainId]
GO
