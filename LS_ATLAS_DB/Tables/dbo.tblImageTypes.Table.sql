USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[tblImageTypes]    Script Date: 6/17/2019 2:22:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblImageTypes](
	[Image_Id] [int] IDENTITY(1,1) NOT NULL,
	[Image_Type] [nvarchar](100) NULL,
	[DomainId] [nvarchar](512) NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblImageTypes] ADD  DEFAULT ('h1') FOR [DomainId]
GO
