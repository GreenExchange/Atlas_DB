USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[txn_ticket_reminder]    Script Date: 6/17/2019 2:22:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[txn_ticket_reminder](
	[i_id] [int] IDENTITY(1,1) NOT NULL,
	[bg_ticket_id] [bigint] NOT NULL,
	[sz_user_name] [nvarchar](20) NOT NULL,
	[dt_created] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[i_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY],
 CONSTRAINT [pk_cmp_ticket_user] UNIQUE NONCLUSTERED 
(
	[bg_ticket_id] ASC,
	[sz_user_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[txn_ticket_reminder] ADD  DEFAULT (getdate()) FOR [dt_created]
GO
ALTER TABLE [dbo].[txn_ticket_reminder]  WITH CHECK ADD FOREIGN KEY([bg_ticket_id])
REFERENCES [dbo].[mst_ticket] ([bg_ticket_id])
GO
