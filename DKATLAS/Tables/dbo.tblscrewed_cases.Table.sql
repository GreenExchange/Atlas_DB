USE [DKATLAS]
GO
/****** Object:  Table [dbo].[tblscrewed_cases]    Script Date: 6/17/2019 2:53:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblscrewed_cases](
	[case_id] [nvarchar](50) NOT NULL,
	[insurancecompany_id] [int] NOT NULL
) ON [PRIMARY]
GO
