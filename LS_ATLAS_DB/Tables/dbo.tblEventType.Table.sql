USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[tblEventType]    Script Date: 6/17/2019 2:22:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEventType](
	[EventTypeId] [int] IDENTITY(1,1) NOT NULL,
	[EventTypeName] [varchar](100) NOT NULL,
	[DomainId] [nvarchar](512) NOT NULL,
	[created_by_user] [nvarchar](255) NOT NULL,
	[created_date] [datetime] NULL,
	[modified_by_user] [nvarchar](255) NULL,
	[modified_date] [datetime] NULL,
	[EventTypeId_Old] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblEventType] ADD  DEFAULT ('h1') FOR [DomainId]
GO
ALTER TABLE [dbo].[tblEventType] ADD  DEFAULT ('admin') FOR [created_by_user]
GO
ALTER TABLE [dbo].[tblEventType] ADD  CONSTRAINT [DF_tblEventType_created_date]  DEFAULT (getdate()) FOR [created_date]
GO
