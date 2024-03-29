USE [DKATLAS]
GO
/****** Object:  Table [dbo].[TXN_REPOSITORY_UPLOAD]    Script Date: 6/17/2019 2:53:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TXN_REPOSITORY_UPLOAD](
	[I_ID] [bigint] IDENTITY(1,1) NOT NULL,
	[SZ_PROCESS_ID] [nvarchar](50) NOT NULL,
	[SZ_USER_ID] [nvarchar](50) NOT NULL,
	[SZ_FILENAME] [nvarchar](500) NOT NULL,
	[DT_UPLOAD_TIME] [datetime] NOT NULL,
	[SZ_NOTES] [nvarchar](1000) NULL,
	[SZ_CAPTION] [nvarchar](255) NULL
) ON [PRIMARY]
GO
