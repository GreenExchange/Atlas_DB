USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[txn_ticket_thread]    Script Date: 6/17/2019 2:22:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[txn_ticket_thread](
	[i_thread_id] [int] IDENTITY(1,1) NOT NULL,
	[bg_ticket_id] [bigint] NOT NULL,
	[sz_ticket_number] [nvarchar](40) NOT NULL,
	[i_status_id] [int] NULL,
	[sz_description] [nvarchar](max) NOT NULL,
	[dt_raised_on] [datetime] NOT NULL,
	[sz_replied_by] [nvarchar](255) NULL,
	[bt_auto_closed] [bit] NULL,
	[dt_auto_closed_date] [datetime] NULL,
	[dt_estimated_delivery] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[i_thread_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[txn_ticket_thread] ADD  DEFAULT (getdate()) FOR [dt_raised_on]
GO
ALTER TABLE [dbo].[txn_ticket_thread] ADD  DEFAULT (getdate()) FOR [dt_auto_closed_date]
GO
ALTER TABLE [dbo].[txn_ticket_thread]  WITH CHECK ADD FOREIGN KEY([bg_ticket_id])
REFERENCES [dbo].[mst_ticket] ([bg_ticket_id])
GO
ALTER TABLE [dbo].[txn_ticket_thread]  WITH CHECK ADD FOREIGN KEY([i_status_id])
REFERENCES [dbo].[mst_ticket_status] ([i_status_id])
GO
