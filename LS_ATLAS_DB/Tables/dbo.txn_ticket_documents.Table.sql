USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[txn_ticket_documents]    Script Date: 6/17/2019 2:22:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[txn_ticket_documents](
	[i_id] [int] IDENTITY(1,1) NOT NULL,
	[bg_ticket_id] [bigint] NOT NULL,
	[i_thread_id] [int] NULL,
	[sz_ticket_number] [nvarchar](40) NOT NULL,
	[sz_file_name] [nvarchar](255) NOT NULL,
	[sz_file_path] [nvarchar](max) NOT NULL,
	[dt_created] [datetime] NULL,
 CONSTRAINT [PK__txn_tick__EA81CFA6735BD47E] PRIMARY KEY CLUSTERED 
(
	[i_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[txn_ticket_documents]  WITH CHECK ADD  CONSTRAINT [FK__txn_ticke__bg_ti__75441CF0] FOREIGN KEY([bg_ticket_id])
REFERENCES [dbo].[mst_ticket] ([bg_ticket_id])
GO
ALTER TABLE [dbo].[txn_ticket_documents] CHECK CONSTRAINT [FK__txn_ticke__bg_ti__75441CF0]
GO
ALTER TABLE [dbo].[txn_ticket_documents]  WITH CHECK ADD  CONSTRAINT [FK__txn_ticke__i_thr__76384129] FOREIGN KEY([i_thread_id])
REFERENCES [dbo].[txn_ticket_thread] ([i_thread_id])
GO
ALTER TABLE [dbo].[txn_ticket_documents] CHECK CONSTRAINT [FK__txn_ticke__i_thr__76384129]
GO
