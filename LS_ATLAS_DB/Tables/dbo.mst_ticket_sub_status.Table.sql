USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[mst_ticket_sub_status]    Script Date: 6/17/2019 2:22:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mst_ticket_sub_status](
	[i_sub_status_id] [int] IDENTITY(1,1) NOT NULL,
	[sz_sub_status] [nvarchar](40) NULL,
	[c_code] [char](3) NULL,
	[i_display_sequence] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[i_sub_status_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
