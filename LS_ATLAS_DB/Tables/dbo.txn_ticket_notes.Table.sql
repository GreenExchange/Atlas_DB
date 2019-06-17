USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[txn_ticket_notes]    Script Date: 6/17/2019 2:22:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[txn_ticket_notes](
	[i_id] [int] IDENTITY(1,1) NOT NULL,
	[sz_user_name] [nvarchar](20) NULL,
	[bg_ticket_id] [nvarchar](20) NULL,
	[sz_comment] [nvarchar](max) NULL,
	[dt_created_date] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
