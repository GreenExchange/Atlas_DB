USE [DKATLAS]
GO
/****** Object:  Table [dbo].[MST_REQUEST_REJECTION_MASTER]    Script Date: 6/17/2019 2:53:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MST_REQUEST_REJECTION_MASTER](
	[List_Id] [int] IDENTITY(1,1) NOT NULL,
	[List_Name] [nvarchar](500) NULL,
	[List_Status] [nvarchar](100) NULL
) ON [PRIMARY]
GO
