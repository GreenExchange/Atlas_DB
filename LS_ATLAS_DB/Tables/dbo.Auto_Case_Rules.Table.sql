USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[Auto_Case_Rules]    Script Date: 6/17/2019 2:22:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Auto_Case_Rules](
	[case_id] [varchar](50) NULL,
	[rule_desc] [varchar](max) NULL,
	[DomainID] [varchar](50) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
