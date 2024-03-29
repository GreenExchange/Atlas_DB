USE [DKATLAS]
GO
/****** Object:  Table [dbo].[TblProvider_Groups]    Script Date: 6/17/2019 2:53:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblProvider_Groups](
	[Provider_Group_ID] [int] IDENTITY(1,1) NOT NULL,
	[Provider_Group_Name] [varchar](200) NOT NULL,
	[DESCRIPTION] [varchar](200) NULL,
	[SD_CODE] [varchar](50) NULL,
	[AF_Show] [bit] NULL,
	[Email_For_Arb_Awards] [nvarchar](200) NULL,
	[Email_For_Invoices] [nvarchar](200) NULL,
	[Email_For_Closing_Reports] [nvarchar](200) NULL,
	[Email_For_Monthly_Report] [nvarchar](200) NULL,
	[created_by_user] [varchar](255) NOT NULL,
	[created_date] [datetime] NULL,
	[modified_by_user] [varchar](255) NULL,
	[modified_date] [datetime] NULL,
 CONSTRAINT [PK_TblProvider_Groups] PRIMARY KEY CLUSTERED 
(
	[Provider_Group_Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TblProvider_Groups] ADD  CONSTRAINT [DF_TblProvider_Groups_created_by_user]  DEFAULT ('admin') FOR [created_by_user]
GO
ALTER TABLE [dbo].[TblProvider_Groups] ADD  CONSTRAINT [DF_TblProvider_Groups_created_date]  DEFAULT (getdate()) FOR [created_date]
GO
