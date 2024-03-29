USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[tbl_template_word_offline_queue]    Script Date: 6/17/2019 2:22:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_template_word_offline_queue](
	[pk_offline_queue_id] [int] IDENTITY(1,1) NOT NULL,
	[domain_id] [varchar](100) NULL,
	[fk_template_id] [int] NULL,
	[case_ids] [varchar](max) NULL,
	[save_as] [char](5) NULL,
	[NodeName] [varchar](max) NULL,
	[is_upload_docs] [bit] NULL,
	[fk_configured_by_id] [int] NULL,
	[configured_date] [datetime] NULL,
	[is_processed] [bit] NULL,
	[processed_date] [datetime] NULL,
	[file_name] [varchar](max) NULL,
	[file_path] [varchar](max) NULL,
	[changed_status] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[pk_offline_queue_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[tbl_template_word_offline_queue]  WITH CHECK ADD  CONSTRAINT [tbl_template_word_offline_queue_fk_configured_by_id] FOREIGN KEY([fk_configured_by_id])
REFERENCES [dbo].[IssueTracker_Users] ([UserId])
GO
ALTER TABLE [dbo].[tbl_template_word_offline_queue] CHECK CONSTRAINT [tbl_template_word_offline_queue_fk_configured_by_id]
GO
ALTER TABLE [dbo].[tbl_template_word_offline_queue]  WITH CHECK ADD  CONSTRAINT [tbl_template_word_offline_queue_fk_template_id] FOREIGN KEY([fk_template_id])
REFERENCES [dbo].[tbl_template_word] ([pk_template_id])
GO
ALTER TABLE [dbo].[tbl_template_word_offline_queue] CHECK CONSTRAINT [tbl_template_word_offline_queue_fk_template_id]
GO
