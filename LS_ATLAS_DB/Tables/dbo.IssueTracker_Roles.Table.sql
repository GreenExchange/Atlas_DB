USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[IssueTracker_Roles]    Script Date: 6/17/2019 2:22:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IssueTracker_Roles](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NULL,
	[RoleLevel] [int] NULL,
	[RoleType] [nvarchar](50) NULL,
	[DomainId] [nvarchar](512) NULL,
 CONSTRAINT [PK_IssueTracker_Roles] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[IssueTracker_Roles] ADD  CONSTRAINT [DF_IssueTracker_Roles_RoleType]  DEFAULT ('S') FOR [RoleType]
GO
