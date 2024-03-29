USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[tblApplicationSettings]    Script Date: 6/17/2019 2:22:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblApplicationSettings](
	[ParameterID] [int] IDENTITY(1,1) NOT NULL,
	[ParameterName] [varchar](50) NOT NULL,
	[ParameterValue] [varchar](512) NOT NULL,
	[displayname] [varchar](255) NULL,
	[DomainId] [nvarchar](512) NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblApplicationSettings] ADD  DEFAULT ('h1') FOR [DomainId]
GO
