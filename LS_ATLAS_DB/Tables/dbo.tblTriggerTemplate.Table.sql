USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[tblTriggerTemplate]    Script Date: 6/17/2019 2:22:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTriggerTemplate](
	[AutoId] [int] IDENTITY(1,1) NOT NULL,
	[TriggerTypeId] [int] NULL,
	[TemplateId] [int] NULL,
	[DomainId] [varchar](50) NULL,
 CONSTRAINT [PK_tblTriggerTemplate] PRIMARY KEY CLUSTERED 
(
	[AutoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
