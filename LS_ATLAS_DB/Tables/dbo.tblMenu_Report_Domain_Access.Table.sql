USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[tblMenu_Report_Domain_Access]    Script Date: 6/17/2019 2:22:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMenu_Report_Domain_Access](
	[MenuAccessId] [int] IDENTITY(1,1) NOT NULL,
	[ReportMenuId] [int] NOT NULL,
	[DomainId] [varchar](50) NOT NULL,
 CONSTRAINT [IX_Report_Role_Domain_Menu] UNIQUE NONCLUSTERED 
(
	[DomainId] ASC,
	[ReportMenuId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
