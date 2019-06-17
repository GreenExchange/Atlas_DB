USE [DKATLAS]
GO
/****** Object:  Table [dbo].[tblServed]    Script Date: 6/17/2019 2:53:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblServed](
	[InsuranceCompany_Id] [int] NULL,
	[Name] [varchar](50) NULL,
	[Age] [varchar](10) NULL,
	[Weight] [varchar](10) NULL,
	[Height] [varchar](10) NULL,
	[skin] [varchar](50) NULL,
	[hair] [varchar](50) NULL,
	[sex] [varchar](10) NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]
GO
