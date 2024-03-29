USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[mst_ticket]    Script Date: 6/17/2019 2:22:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mst_ticket](
	[bg_ticket_id] [bigint] IDENTITY(1,1) NOT NULL,
	[sz_ticket_number] [nvarchar](40) NULL,
	[sz_company_id] [nvarchar](50) NOT NULL,
	[sz_raised_by] [nvarchar](255) NOT NULL,
	[dt_raised_on] [datetime] NOT NULL,
	[sz_subject] [nvarchar](255) NOT NULL,
	[sz_description] [nvarchar](max) NOT NULL,
	[sz_type] [nvarchar](255) NOT NULL,
	[sz_sub_type] [nvarchar](255) NULL,
	[dt_last_activity] [datetime] NULL,
	[sz_callback_phone] [nvarchar](255) NULL,
	[i_status_id] [int] NULL,
	[sz_default_mail] [nvarchar](255) NULL,
	[sz_mail_cc] [nvarchar](max) NULL,
	[i_priority_id] [int] NULL,
	[bt_associate_account] [bit] NULL,
	[sz_associate_account] [nvarchar](20) NULL,
	[dt_estimated_delivery] [datetime] NULL,
	[bt_estimated_delivery] [bit] NULL,
	[i_sub_status_id] [int] NULL,
	[i_note_count] [int] NULL,
	[sz_assigned_to] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[bg_ticket_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[sz_ticket_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[mst_ticket] ADD  DEFAULT (getdate()) FOR [dt_raised_on]
GO
ALTER TABLE [dbo].[mst_ticket]  WITH CHECK ADD FOREIGN KEY([i_priority_id])
REFERENCES [dbo].[mst_ticket_priority] ([i_priority_id])
GO
ALTER TABLE [dbo].[mst_ticket]  WITH CHECK ADD FOREIGN KEY([i_status_id])
REFERENCES [dbo].[mst_ticket_status] ([i_status_id])
GO
