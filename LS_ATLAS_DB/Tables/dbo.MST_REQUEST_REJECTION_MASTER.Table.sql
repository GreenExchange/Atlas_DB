USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[MST_REQUEST_REJECTION_MASTER]    Script Date: 6/17/2019 2:22:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MST_REQUEST_REJECTION_MASTER](
	[List_Id] [int] IDENTITY(1,1) NOT NULL,
	[List_Name] [nvarchar](500) NULL,
	[List_Status] [nvarchar](100) NULL,
	[DomainId] [nvarchar](512) NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[MST_REQUEST_REJECTION_MASTER] ADD  DEFAULT ('h1') FOR [DomainId]
GO
