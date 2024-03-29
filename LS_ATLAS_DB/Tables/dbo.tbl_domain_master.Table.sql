USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[tbl_domain_master]    Script Date: 6/17/2019 2:22:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_domain_master](
	[pk_domain_id] [int] IDENTITY(1,1) NOT NULL,
	[domain_name] [varchar](max) NOT NULL,
	[appname] [varchar](max) NOT NULL,
	[webservice_url] [varchar](max) NULL,
	[remarks] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[pk_domain_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
