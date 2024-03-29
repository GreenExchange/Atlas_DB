USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[txn_ticket_note_seen_tracker_history]    Script Date: 6/17/2019 2:22:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[txn_ticket_note_seen_tracker_history](
	[i_id] [int] IDENTITY(1,1) NOT NULL,
	[i_note_id] [int] NOT NULL,
	[bg_ticket_id] [bigint] NOT NULL,
	[sz_user_name] [nvarchar](40) NOT NULL,
	[dt_created] [datetime] NOT NULL,
 CONSTRAINT [pkc1_i_note_id_sz_user_name] PRIMARY KEY CLUSTERED 
(
	[i_note_id] ASC,
	[sz_user_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
