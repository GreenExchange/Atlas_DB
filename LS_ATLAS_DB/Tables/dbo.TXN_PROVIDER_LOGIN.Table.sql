USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[TXN_PROVIDER_LOGIN]    Script Date: 6/17/2019 2:22:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TXN_PROVIDER_LOGIN](
	[Auto_Id] [int] IDENTITY(1,1) NOT NULL,
	[Provider_id] [nvarchar](50) NULL,
	[user_id] [int] NULL,
	[DomainId] [nvarchar](512) NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TXN_PROVIDER_LOGIN] ADD  DEFAULT ('h1') FOR [DomainId]
GO
