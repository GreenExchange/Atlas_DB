USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[TblProvider_Groups]    Script Date: 6/17/2019 2:22:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblProvider_Groups](
	[Provider_Group_ID] [int] IDENTITY(1,1) NOT NULL,
	[Provider_Group_Name] [varchar](200) NOT NULL,
	[DESCRIPTION] [varchar](500) NULL,
	[SD_CODE] [varchar](50) NULL,
	[AF_Show] [bit] NULL,
	[Email_For_Arb_Awards] [varchar](200) NULL,
	[Email_For_Invoices] [varchar](200) NULL,
	[Email_For_Closing_Reports] [varchar](200) NULL,
	[Email_For_Monthly_Report] [varchar](200) NULL,
	[DomainId] [varchar](50) NOT NULL,
	[created_by_user] [varchar](255) NOT NULL,
	[created_date] [datetime] NULL,
	[modified_by_user] [varchar](255) NULL,
	[modified_date] [datetime] NULL,
 CONSTRAINT [PK_TblProvider_Groups] PRIMARY KEY CLUSTERED 
(
	[Provider_Group_Name] ASC,
	[DomainId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TblProvider_Groups] ADD  CONSTRAINT [DF_TblProvider_Groups_Provider_Group_Name]  DEFAULT ('p1') FOR [Provider_Group_Name]
GO
ALTER TABLE [dbo].[TblProvider_Groups] ADD  CONSTRAINT [DF__TblProvid__Domai__753864A1]  DEFAULT ('h1') FOR [DomainId]
GO
ALTER TABLE [dbo].[TblProvider_Groups] ADD  CONSTRAINT [DF__TblProvid__creat__5674B1B6]  DEFAULT ('admin') FOR [created_by_user]
GO
ALTER TABLE [dbo].[TblProvider_Groups] ADD  CONSTRAINT [DF_Provider_Groups_created_date]  DEFAULT (getdate()) FOR [created_date]
GO
