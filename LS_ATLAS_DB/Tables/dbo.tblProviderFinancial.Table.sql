USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[tblProviderFinancial]    Script Date: 6/17/2019 2:22:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProviderFinancial](
	[Srl_No] [int] IDENTITY(1,1) NOT NULL,
	[Provider_Id] [nvarchar](100) NULL,
	[DomainId] [nvarchar](512) NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblProviderFinancial] ADD  DEFAULT ('h1') FOR [DomainId]
GO
