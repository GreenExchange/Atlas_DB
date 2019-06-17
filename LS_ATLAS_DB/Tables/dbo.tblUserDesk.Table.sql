USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[tblUserDesk]    Script Date: 6/17/2019 2:22:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUserDesk](
	[UserName] [nvarchar](50) NULL,
	[Desk_Id] [int] NULL,
	[DomainId] [nvarchar](512) NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblUserDesk] ADD  DEFAULT ('h1') FOR [DomainId]
GO
