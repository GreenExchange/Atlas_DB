USE [DKATLAS]
GO
/****** Object:  Table [dbo].[tblExhibitSequence]    Script Date: 6/17/2019 2:53:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblExhibitSequence](
	[Case_Id] [nvarchar](50) NOT NULL,
	[Exhibit_Id] [int] NOT NULL,
	[Sequence] [int] NOT NULL
) ON [PRIMARY]
GO
