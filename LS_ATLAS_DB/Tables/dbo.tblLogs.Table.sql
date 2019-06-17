USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[tblLogs]    Script Date: 6/17/2019 2:22:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLogs](
	[szMessage] [nvarchar](2000) NULL,
	[dt] [datetime] NULL,
	[DomainId] [nvarchar](512) NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLogs] ADD  DEFAULT (getdate()) FOR [dt]
GO
ALTER TABLE [dbo].[tblLogs] ADD  DEFAULT ('h1') FOR [DomainId]
GO
