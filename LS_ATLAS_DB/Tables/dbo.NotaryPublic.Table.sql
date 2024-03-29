USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[NotaryPublic]    Script Date: 6/17/2019 2:22:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NotaryPublic](
	[NotaryPublicID] [int] IDENTITY(1,1) NOT NULL,
	[NPFirstName] [nvarchar](50) NULL,
	[NPMiddle] [nvarchar](50) NULL,
	[NPLastName] [nvarchar](50) NULL,
	[NPCounty] [nvarchar](50) NULL,
	[NPRegistrationNo] [nvarchar](50) NULL,
	[NPExpDate] [datetime] NULL,
	[NPPriority] [tinyint] NOT NULL,
	[DomainId] [nvarchar](512) NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[NotaryPublic] ADD  CONSTRAINT [DF_NotaryPublic_NPPriority]  DEFAULT ((0)) FOR [NPPriority]
GO
ALTER TABLE [dbo].[NotaryPublic] ADD  DEFAULT ('h1') FOR [DomainId]
GO
