USE [DKATLAS]
GO
/****** Object:  Table [dbo].[tblApplicationSettings]    Script Date: 6/17/2019 2:53:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblApplicationSettings](
	[ParameterID] [int] NOT NULL,
	[ParameterName] [varchar](50) NOT NULL,
	[ParameterValue] [varchar](512) NOT NULL,
	[displayname] [varchar](255) NULL
) ON [PRIMARY]
GO
