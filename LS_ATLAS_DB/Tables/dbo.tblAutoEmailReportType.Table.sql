USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[tblAutoEmailReportType]    Script Date: 6/17/2019 2:22:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAutoEmailReportType](
	[pk_report_type_id] [int] IDENTITY(1,1) NOT NULL,
	[DomainId] [varchar](50) NOT NULL,
	[report_type] [varchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[pk_report_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
