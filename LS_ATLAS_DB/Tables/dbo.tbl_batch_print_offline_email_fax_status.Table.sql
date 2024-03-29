USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[tbl_batch_print_offline_email_fax_status]    Script Date: 6/17/2019 2:22:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_batch_print_offline_email_fax_status](
	[pk_bp_ef_status_id] [bigint] IDENTITY(1,1) NOT NULL,
	[fk_batch_print_id] [int] NOT NULL,
	[case_Id] [nvarchar](100) NOT NULL,
	[DomainID] [varchar](50) NOT NULL,
	[fk_batch_entity_type_id] [int] NOT NULL,
	[documentImageID] [bigint] NULL,
	[emailStatus] [varchar](10) NULL,
	[emailStatusDate] [datetime] NULL,
	[emailAcknowledgementKey] [uniqueidentifier] NULL,
	[isEmailAcknowledged] [bit] NULL,
	[emailAcknowledgementDate] [datetime] NULL,
	[faxQueueID] [bigint] NULL,
	[faxStatus] [varchar](50) NULL,
	[faxStatusDate] [datetime] NULL,
	[faxAcknowledgementImageID] [bigint] NULL,
	[faxAcknowledgementDate] [datetime] NULL,
	[ResendCount] [int] NULL,
	[isDeleted] [bit] NULL,
	[in_progress] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[pk_bp_ef_status_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tbl_batch_print_offline_email_fax_status]  WITH CHECK ADD  CONSTRAINT [tbl_batch_print_offline_email_fax_status_fk_batch_entity_type_id] FOREIGN KEY([fk_batch_entity_type_id])
REFERENCES [dbo].[tbl_batch_entity_type] ([ID])
GO
ALTER TABLE [dbo].[tbl_batch_print_offline_email_fax_status] CHECK CONSTRAINT [tbl_batch_print_offline_email_fax_status_fk_batch_entity_type_id]
GO
ALTER TABLE [dbo].[tbl_batch_print_offline_email_fax_status]  WITH CHECK ADD  CONSTRAINT [tbl_batch_print_offline_email_fax_status_fk_batch_print_id] FOREIGN KEY([fk_batch_print_id])
REFERENCES [dbo].[tbl_batch_print_offline_queue] ([pk_batch_print_Id])
GO
ALTER TABLE [dbo].[tbl_batch_print_offline_email_fax_status] CHECK CONSTRAINT [tbl_batch_print_offline_email_fax_status_fk_batch_print_id]
GO
