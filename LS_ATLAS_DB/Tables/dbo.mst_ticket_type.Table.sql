USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[mst_ticket_type]    Script Date: 6/17/2019 2:22:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mst_ticket_type](
	[i_type_id] [int] IDENTITY(1,1) NOT NULL,
	[sz_ticket_type] [char](3) NOT NULL
) ON [PRIMARY]
GO
