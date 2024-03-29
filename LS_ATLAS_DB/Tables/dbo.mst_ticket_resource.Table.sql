USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[mst_ticket_resource]    Script Date: 6/17/2019 2:22:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mst_ticket_resource](
	[sz_user_name] [nvarchar](50) NULL,
	[sz_friendly_name] [nvarchar](50) NULL,
	[dt_created_on] [datetime] NULL,
	[dt_updated_on] [datetime] NULL,
	[bt_active] [bit] NULL,
	[i_resource_id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_mst_ticket_resource] PRIMARY KEY CLUSTERED 
(
	[i_resource_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
