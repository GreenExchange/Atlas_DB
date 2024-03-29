USE [DKATLAS]
GO
/****** Object:  Table [dbo].[tblUserStatus]    Script Date: 6/17/2019 2:53:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUserStatus](
	[UserStatusID] [int] IDENTITY(1,1) NOT NULL,
	[userid] [nvarchar](100) NULL,
	[username] [nvarchar](255) NULL,
	[Status] [nvarchar](500) NULL,
	[CriticalDays] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
