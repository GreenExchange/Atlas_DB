USE [DKATLAS]
GO
/****** Object:  Table [dbo].[AdminNotes]    Script Date: 6/17/2019 2:53:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdminNotes](
	[Notes_ID] [int] IDENTITY(1,1) NOT NULL,
	[Notes_Desc] [nvarchar](3000) NULL,
	[Notes_Date] [datetime] NULL,
	[User_Id] [nvarchar](50) NULL,
	[Type] [nvarchar](200) NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AdminNotes] ADD  CONSTRAINT [DF_AdminNotes1_Notes_Date_1]  DEFAULT (getdate()) FOR [Notes_Date]
GO
ALTER TABLE [dbo].[AdminNotes] ADD  CONSTRAINT [DF_AdminNotes1_User_Id_1]  DEFAULT ('system') FOR [User_Id]
GO
