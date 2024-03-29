USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[tblPomCase]    Script Date: 6/17/2019 2:22:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPomCase](
	[pom_id] [int] NOT NULL,
	[case_id] [nvarchar](50) NOT NULL,
	[DomainId] [nvarchar](512) NOT NULL,
	[POM_FileName] [varchar](500) NULL,
	[POM_PacketFileName] [varchar](200) NULL,
	[POMType] [varchar](50) NULL,
	[BasePathId] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblPomCase] ADD  DEFAULT ('h1') FOR [DomainId]
GO
