USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[tblExhibitSequence]    Script Date: 6/17/2019 2:22:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblExhibitSequence](
	[Case_Id] [nvarchar](50) NOT NULL,
	[Exhibit_Id] [int] NOT NULL,
	[Sequence] [int] NOT NULL,
	[DomainId] [nvarchar](512) NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblExhibitSequence] ADD  DEFAULT ('h1') FOR [DomainId]
GO
