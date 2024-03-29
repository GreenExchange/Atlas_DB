USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[txn_ticket_assign_history]    Script Date: 6/17/2019 2:22:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[txn_ticket_assign_history](
	[i_id] [int] IDENTITY(1,1) NOT NULL,
	[bg_ticket_id] [bigint] NULL,
	[dt_created] [datetime] NULL,
	[sz_created_by] [nvarchar](100) NULL,
	[sz_assigned_to] [nvarchar](200) NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[txn_ticket_assign_history]  WITH CHECK ADD  CONSTRAINT [fk_tah_mt_bgtid] FOREIGN KEY([bg_ticket_id])
REFERENCES [dbo].[mst_ticket] ([bg_ticket_id])
GO
ALTER TABLE [dbo].[txn_ticket_assign_history] CHECK CONSTRAINT [fk_tah_mt_bgtid]
GO
