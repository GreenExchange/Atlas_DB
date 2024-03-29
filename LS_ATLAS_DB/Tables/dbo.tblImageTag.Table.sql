USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[tblImageTag]    Script Date: 6/17/2019 2:22:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblImageTag](
	[ImageID] [bigint] NOT NULL,
	[TagID] [bigint] NOT NULL,
	[LoginID] [nchar](20) NULL,
	[DateInserted] [datetime] NULL,
	[DateModified] [datetime] NULL,
	[DateScanned] [datetime] NULL,
	[DomainId] [nvarchar](512) NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblImageTag] ADD  DEFAULT ('h1') FOR [DomainId]
GO
