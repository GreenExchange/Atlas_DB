USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[tbl_template_column]    Script Date: 6/17/2019 2:22:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_template_column](
	[s_no] [int] IDENTITY(1,1) NOT NULL,
	[column_name] [varchar](max) NOT NULL,
	[status] [int] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
