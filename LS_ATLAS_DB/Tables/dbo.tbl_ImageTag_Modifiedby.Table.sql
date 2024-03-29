USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[tbl_ImageTag_Modifiedby]    Script Date: 6/17/2019 2:22:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_ImageTag_Modifiedby](
	[s_no] [int] IDENTITY(1,1) NOT NULL,
	[ImageId] [bigint] NOT NULL,
	[modified_by] [int] NOT NULL,
	[DomainId] [nvarchar](512) NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tbl_ImageTag_Modifiedby] ADD  DEFAULT ('h1') FOR [DomainId]
GO
