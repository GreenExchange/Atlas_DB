USE [DKATLAS]
GO
/****** Object:  Table [dbo].[tbl_display_column]    Script Date: 6/17/2019 2:53:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_display_column](
	[pk_display_column_id] [int] IDENTITY(1,1) NOT NULL,
	[display_name] [nvarchar](100) NOT NULL,
	[table_column] [nvarchar](100) NOT NULL,
	[is_default] [bit] NULL,
	[column_order] [int] NULL,
 CONSTRAINT [PK_tbl_display_column] PRIMARY KEY CLUSTERED 
(
	[pk_display_column_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
