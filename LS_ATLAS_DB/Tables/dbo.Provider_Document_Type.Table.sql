USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[Provider_Document_Type]    Script Date: 6/17/2019 2:22:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Provider_Document_Type](
	[Doc_Id] [int] IDENTITY(1,1) NOT NULL,
	[ProviderDoc_Type] [nvarchar](50) NOT NULL,
	[domainId] [nvarchar](50) NULL,
	[created_by_user] [nvarchar](255) NOT NULL,
	[created_date] [datetime] NULL,
	[modified_by_user] [nvarchar](255) NULL,
	[modified_date] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Provider_Document_Type] ADD  DEFAULT ('admin') FOR [created_by_user]
GO
