USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[tbllog]    Script Date: 6/17/2019 2:22:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbllog](
	[column1] [nvarchar](1000) NULL,
	[DomainId] [nvarchar](512) NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tbllog] ADD  DEFAULT ('h1') FOR [DomainId]
GO
