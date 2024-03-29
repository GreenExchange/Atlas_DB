USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[tbl_template_word]    Script Date: 6/17/2019 2:22:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_template_word](
	[pk_template_id] [int] IDENTITY(1,1) NOT NULL,
	[template_name] [varchar](200) NOT NULL,
	[remarks] [varchar](500) NULL,
	[template_file_name] [varchar](500) NULL,
	[template_path] [varchar](1000) NULL,
	[fk_default_node_id] [int] NULL,
	[DomainId] [varchar](100) NOT NULL,
	[created_by_user] [nvarchar](255) NOT NULL,
	[created_date] [datetime] NULL,
	[modified_by_user] [nvarchar](255) NULL,
	[modified_date] [datetime] NULL,
	[template_tag_array] [varchar](max) NULL,
	[Status_Id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[pk_template_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[tbl_template_word] ADD  CONSTRAINT [DF__tbl_templ__creat__0EEE1503]  DEFAULT ('admin') FOR [created_by_user]
GO
