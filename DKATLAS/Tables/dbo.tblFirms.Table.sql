USE [DKATLAS]
GO
/****** Object:  Table [dbo].[tblFirms]    Script Date: 6/17/2019 2:53:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblFirms](
	[Firm_AutoId] [int] IDENTITY(1,1) NOT NULL,
	[Firm_Id] [nvarchar](50) NOT NULL,
	[Firm_Name] [varchar](100) NOT NULL,
	[Firm_Address] [varchar](255) NULL,
	[Firm_City] [varchar](100) NULL,
	[Firm_State] [varchar](100) NULL,
	[Firm_Zip] [varchar](20) NULL,
	[Firm_Phone] [varchar](20) NULL,
	[Firm_Fax] [varchar](20) NULL,
	[Firm_Email] [varchar](100) NULL
) ON [PRIMARY]
GO
