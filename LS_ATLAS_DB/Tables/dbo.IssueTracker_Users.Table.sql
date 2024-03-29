USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[IssueTracker_Users]    Script Date: 6/17/2019 2:22:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IssueTracker_Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](255) NOT NULL,
	[UserPassword] [nvarchar](20) NULL,
	[RoleId] [int] NOT NULL,
	[Email] [nvarchar](255) NULL,
	[DisplayName] [nvarchar](50) NOT NULL,
	[UserTypeLogin] [nvarchar](100) NULL,
	[UserType] [nvarchar](10) NULL,
	[IsActive] [bit] NOT NULL,
	[bit_for_reports_case_search] [bit] NULL,
	[bit_for_Provider_Cases] [bit] NULL,
	[last_name] [nvarchar](200) NULL,
	[first_name] [nvarchar](200) NULL,
	[UserRole] [nvarchar](200) NULL,
	[DomainId] [nvarchar](50) NULL,
	[ProviderId] [int] NULL,
	[IsSecretary] [bit] NULL,
 CONSTRAINT [PK_IssueTracker_Users] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[IssueTracker_Users] ADD  CONSTRAINT [DF_IssueTracker_Users_Email]  DEFAULT (N'a@b.com') FOR [Email]
GO
ALTER TABLE [dbo].[IssueTracker_Users] ADD  CONSTRAINT [DF_IssueTracker_Users_UserType]  DEFAULT ('S') FOR [UserType]
GO
ALTER TABLE [dbo].[IssueTracker_Users] ADD  CONSTRAINT [DF_IssueTracker_Users_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[IssueTracker_Users] ADD  CONSTRAINT [DF_IssueTracker_Users_DomainId]  DEFAULT (N'dk') FOR [DomainId]
GO
ALTER TABLE [dbo].[IssueTracker_Users] ADD  DEFAULT ((0)) FOR [IsSecretary]
GO
