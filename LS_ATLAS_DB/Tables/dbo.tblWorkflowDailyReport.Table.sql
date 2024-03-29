USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[tblWorkflowDailyReport]    Script Date: 6/17/2019 2:22:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblWorkflowDailyReport](
	[DailyReportID] [int] IDENTITY(1,1) NOT NULL,
	[DomainId] [varchar](50) NOT NULL,
	[Email_To] [varchar](max) NOT NULL,
	[Email_CC] [varchar](max) NULL,
	[Email_BCC] [varchar](max) NULL,
	[Sent_Date] [datetime] NULL,
 CONSTRAINT [PK_tblWorkflowDailyReport] PRIMARY KEY CLUSTERED 
(
	[DailyReportID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
