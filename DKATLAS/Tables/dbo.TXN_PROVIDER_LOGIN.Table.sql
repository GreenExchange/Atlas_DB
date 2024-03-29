USE [DKATLAS]
GO
/****** Object:  Table [dbo].[TXN_PROVIDER_LOGIN]    Script Date: 6/17/2019 2:53:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TXN_PROVIDER_LOGIN](
	[Auto_Id] [int] IDENTITY(1,1) NOT NULL,
	[Provider_id] [nvarchar](50) NULL,
	[user_id] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TXN_PROVIDER_LOGIN]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[IssueTracker_Users] ([UserId])
GO
ALTER TABLE [dbo].[TXN_PROVIDER_LOGIN]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[IssueTracker_Users] ([UserId])
GO
ALTER TABLE [dbo].[TXN_PROVIDER_LOGIN]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[IssueTracker_Users] ([UserId])
GO
ALTER TABLE [dbo].[TXN_PROVIDER_LOGIN]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[IssueTracker_Users] ([UserId])
GO
