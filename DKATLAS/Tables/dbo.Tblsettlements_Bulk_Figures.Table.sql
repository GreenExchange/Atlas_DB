USE [DKATLAS]
GO
/****** Object:  Table [dbo].[Tblsettlements_Bulk_Figures]    Script Date: 6/17/2019 2:53:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tblsettlements_Bulk_Figures](
	[GROUP_CODE] [varchar](50) NOT NULL,
	[PROVIDER_ID] [int] NOT NULL,
	[SETT_RATE] [decimal](4, 4) NOT NULL,
	[AF_RATE] [decimal](4, 4) NOT NULL,
	[AF_MIN] [money] NOT NULL,
	[AF_MAX] [money] NOT NULL,
	[FF_BASE] [money] NOT NULL
) ON [PRIMARY]
GO
