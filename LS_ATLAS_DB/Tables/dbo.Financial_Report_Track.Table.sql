USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[Financial_Report_Track]    Script Date: 6/17/2019 2:22:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Financial_Report_Track](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DomainID] [nvarchar](50) NULL,
	[provider_id] [int] NULL,
	[provider_name] [nvarchar](150) NULL,
	[report_month] [nvarchar](50) NULL,
	[file_path] [nvarchar](500) NULL,
	[mail_sent] [nvarchar](50) NULL,
	[sent_date] [datetime] NULL,
	[file_name] [varchar](500) NULL,
	[BasePathId] [int] NULL,
 CONSTRAINT [PK_Financial_Report_Track] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
