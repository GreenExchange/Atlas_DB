USE [DKATLAS]
GO
/****** Object:  Table [dbo].[tblscrewed_cases2]    Script Date: 6/17/2019 2:53:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblscrewed_cases2](
	[case_id] [nvarchar](50) NOT NULL,
	[insurancecompany_name] [varchar](250) NULL,
	[insurancecompany_code] [varchar](100) NULL,
	[new_ins_id] [int] NULL
) ON [PRIMARY]
GO
