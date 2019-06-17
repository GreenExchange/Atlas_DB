USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[MST_TEMPLATES_COLUMN]    Script Date: 6/17/2019 2:22:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MST_TEMPLATES_COLUMN](
	[COLUMN_NAME] [varchar](400) NOT NULL,
 CONSTRAINT [PK_MST_TEMPLATES_COLUMN] PRIMARY KEY CLUSTERED 
(
	[COLUMN_NAME] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
