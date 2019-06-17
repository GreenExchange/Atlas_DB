USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[InsField]    Script Date: 6/17/2019 2:22:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InsField](
	[F1] [nvarchar](255) NULL,
	[F2] [nvarchar](255) NULL,
	[DomainId] [nvarchar](512) NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[InsField] ADD  DEFAULT ('h1') FOR [DomainId]
GO
