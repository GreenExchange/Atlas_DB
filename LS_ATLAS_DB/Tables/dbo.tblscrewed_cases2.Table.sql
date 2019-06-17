USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[tblscrewed_cases2]    Script Date: 6/17/2019 2:22:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblscrewed_cases2](
	[case_id] [nvarchar](50) NOT NULL,
	[insurancecompany_name] [varchar](250) NULL,
	[insurancecompany_code] [varchar](100) NULL,
	[new_ins_id] [int] NULL,
	[DomainId] [nvarchar](512) NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblscrewed_cases2] ADD  DEFAULT ('h1') FOR [DomainId]
GO
