USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[tbl_batch_print_fax_queue]    Script Date: 6/17/2019 2:22:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_batch_print_fax_queue](
	[pk_bp_fax_queue_id] [int] IDENTITY(1,1) NOT NULL,
	[Domain_Id] [varchar](50) NOT NULL,
	[fk_bp_ef_status_id] [bigint] NOT NULL,
	[FaxNumber] [varchar](50) NOT NULL,
	[SentByUser] [varchar](max) NULL,
	[SentOn] [datetime] NULL,
	[isDeleted] [bit] NULL,
	[IsAddedtoQueue] [bit] NULL,
	[AddedtoQueueDate] [datetime] NULL,
	[CoverPageText] [varchar](max) NULL,
	[AddToQueueCount] [int] NULL,
	[RecipientName] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[pk_bp_fax_queue_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[tbl_batch_print_fax_queue]  WITH CHECK ADD  CONSTRAINT [tbl_batch_print_fax_queue_fk_bp_ef_status_id] FOREIGN KEY([fk_bp_ef_status_id])
REFERENCES [dbo].[tbl_batch_print_offline_email_fax_status] ([pk_bp_ef_status_id])
GO
ALTER TABLE [dbo].[tbl_batch_print_fax_queue] CHECK CONSTRAINT [tbl_batch_print_fax_queue_fk_bp_ef_status_id]
GO
