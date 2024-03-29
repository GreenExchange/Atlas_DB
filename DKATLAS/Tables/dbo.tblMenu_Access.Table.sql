USE [DKATLAS]
GO
/****** Object:  Table [dbo].[tblMenu_Access]    Script Date: 6/17/2019 2:53:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMenu_Access](
	[MenuAccessId] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [int] NOT NULL,
	[MenuId] [int] NOT NULL,
 CONSTRAINT [IX_Role_Menu] UNIQUE NONCLUSTERED 
(
	[RoleId] ASC,
	[MenuId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblMenu_Access]  WITH CHECK ADD  CONSTRAINT [FK_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[IssueTracker_Roles] ([RoleId])
GO
ALTER TABLE [dbo].[tblMenu_Access] CHECK CONSTRAINT [FK_RoleId]
GO
