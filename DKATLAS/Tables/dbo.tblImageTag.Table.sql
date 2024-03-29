USE [DKATLAS]
GO
/****** Object:  Table [dbo].[tblImageTag]    Script Date: 6/17/2019 2:53:57 AM ******/
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
	[DateScanned] [datetime] NULL
) ON [PRIMARY]
GO
