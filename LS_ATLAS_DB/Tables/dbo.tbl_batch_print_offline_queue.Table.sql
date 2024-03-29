USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[tbl_batch_print_offline_queue]    Script Date: 6/17/2019 2:22:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_batch_print_offline_queue](
	[pk_batch_print_Id] [int] IDENTITY(1,1) NOT NULL,
	[DomainId] [varchar](50) NULL,
	[printing_type] [varchar](150) NULL,
	[case_ids] [varchar](max) NULL,
	[node_name] [varchar](250) NULL,
	[changed_status] [varchar](250) NULL,
	[is_upload_docs] [bit] NULL,
	[fk_configured_by_id] [int] NULL,
	[configured_date] [datetime] NULL,
	[is_processed] [bit] NULL,
	[processed_date] [datetime] NULL,
	[file_name] [varchar](max) NULL,
	[file_path] [varchar](max) NULL,
	[in_progress] [bit] NULL,
	[processed_case_ids] [varchar](max) NULL,
	[failed_case_ids] [varchar](max) NULL,
	[fk_batch_type_id] [int] NULL,
	[fk_template_id] [int] NULL,
	[entity_type_ids] [varchar](max) NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_tbl_batch_print_offline_queue] PRIMARY KEY CLUSTERED 
(
	[pk_batch_print_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[tbl_batch_print_offline_queue]  WITH CHECK ADD  CONSTRAINT [FK_tbl_batch_print_offline_queue_IssueTracker_Users] FOREIGN KEY([fk_configured_by_id])
REFERENCES [dbo].[IssueTracker_Users] ([UserId])
GO
ALTER TABLE [dbo].[tbl_batch_print_offline_queue] CHECK CONSTRAINT [FK_tbl_batch_print_offline_queue_IssueTracker_Users]
GO
ALTER TABLE [dbo].[tbl_batch_print_offline_queue]  WITH CHECK ADD  CONSTRAINT [tbl_batch_print_offline_queue_fk_batch_type_id] FOREIGN KEY([fk_batch_type_id])
REFERENCES [dbo].[tbl_batch_type] ([ID])
GO
ALTER TABLE [dbo].[tbl_batch_print_offline_queue] CHECK CONSTRAINT [tbl_batch_print_offline_queue_fk_batch_type_id]
GO
ALTER TABLE [dbo].[tbl_batch_print_offline_queue]  WITH CHECK ADD  CONSTRAINT [tbl_batch_print_offline_queue_fk_template_id] FOREIGN KEY([fk_template_id])
REFERENCES [dbo].[tbl_template_word] ([pk_template_id])
GO
ALTER TABLE [dbo].[tbl_batch_print_offline_queue] CHECK CONSTRAINT [tbl_batch_print_offline_queue_fk_template_id]
GO
