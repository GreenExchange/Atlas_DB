USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[tblMenu_Report]    Script Date: 6/17/2019 2:22:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMenu_Report](
	[ReportMenuID] [int] IDENTITY(1,1) NOT NULL,
	[MenuName] [varchar](100) NOT NULL,
	[MenuLink] [varchar](1000) NULL,
	[Description] [varchar](255) NULL,
	[ParentID] [int] NULL,
	[DomainId] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblReportMenu] PRIMARY KEY CLUSTERED 
(
	[ReportMenuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
