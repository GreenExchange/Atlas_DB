USE [DKATLAS]
GO
/****** Object:  Table [dbo].[tblEventType]    Script Date: 6/17/2019 2:53:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEventType](
	[EventTypeId] [int] IDENTITY(1,1) NOT NULL,
	[EventTypeName] [varchar](100) NOT NULL,
	[created_by_user] [nvarchar](255) NOT NULL,
	[created_date] [datetime] NULL,
	[modified_by_user] [nvarchar](255) NULL,
	[modified_date] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblEventType] ADD  DEFAULT ('admin') FOR [created_by_user]
GO
