USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[IssueTracker_Users_LoginTime]    Script Date: 6/17/2019 2:22:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IssueTracker_Users_LoginTime](
	[AutoId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](50) NULL,
	[Login_Time] [datetime] NULL,
	[Logout_time] [datetime] NULL,
	[DomainId] [nvarchar](512) NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[IssueTracker_Users_LoginTime] ADD  DEFAULT ('h1') FOR [DomainId]
GO
