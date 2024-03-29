USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[txn_ticket_sub_status_history]    Script Date: 6/17/2019 2:22:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[txn_ticket_sub_status_history](
	[i_sub_status_history_id] [int] IDENTITY(1,1) NOT NULL,
	[i_sub_status_id] [int] NULL,
	[bg_ticket_id] [bigint] NULL,
	[dt_created] [datetime] NULL,
	[dt_updated] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[i_sub_status_history_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
