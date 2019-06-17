USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[txn_ticket_has_unseen_notes]    Script Date: 6/17/2019 2:22:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[txn_ticket_has_unseen_notes](
	[i_id] [int] IDENTITY(1,1) NOT NULL,
	[bg_ticket_id] [bigint] NOT NULL,
	[sz_user_name] [nvarchar](40) NOT NULL,
	[bt_has_unseen_notes] [bit] NULL
) ON [PRIMARY]
GO
