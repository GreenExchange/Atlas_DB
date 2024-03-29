USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[tbl_document_log]    Script Date: 6/17/2019 2:22:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_document_log](
	[pk_log_id] [int] IDENTITY(1,1) NOT NULL,
	[fk_user_id] [int] NOT NULL,
	[fk_node_id] [int] NOT NULL,
	[document_name] [varchar](max) NULL,
	[operation] [varchar](100) NOT NULL,
	[log_date_time] [datetime] NOT NULL,
	[log_action] [varchar](max) NULL,
	[pk_case_id] [nvarchar](50) NULL,
	[DomainId] [nvarchar](512) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[tbl_document_log] ADD  DEFAULT ('h1') FOR [DomainId]
GO
