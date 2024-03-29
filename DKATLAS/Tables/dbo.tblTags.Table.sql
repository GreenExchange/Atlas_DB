USE [DKATLAS]
GO
/****** Object:  Table [dbo].[tblTags]    Script Date: 6/17/2019 2:53:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTags](
	[NodeID] [int] IDENTITY(1,1) NOT NULL,
	[ParentID] [int] NULL,
	[NodeName] [nvarchar](300) NULL,
	[CaseID] [nvarchar](50) NULL,
	[DocTypeID] [int] NULL,
	[NodeIcon] [nvarchar](50) NULL,
	[NodeLevel] [int] NULL,
	[Expanded] [bit] NULL,
	[TSTAMP]  AS (getdate()),
	[NodeType] [nvarchar](6) NULL,
	[CaseType] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblTags] PRIMARY KEY CLUSTERED 
(
	[NodeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
