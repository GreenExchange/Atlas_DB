USE [DKATLAS]
GO
/****** Object:  Table [dbo].[H_tblNotes]    Script Date: 6/17/2019 2:53:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[H_tblNotes](
	[Notes_ID] [int] NOT NULL,
	[Notes_Desc] [nvarchar](3000) NULL,
	[Notes_Type] [nvarchar](20) NULL,
	[Notes_Priority] [nvarchar](3) NULL,
	[Case_Id] [nvarchar](100) NOT NULL,
	[Notes_Date] [smalldatetime] NULL,
	[User_Id] [nvarchar](50) NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[H_tblNotes] ADD  CONSTRAINT [DF_tblNotes_Notes_Date_H]  DEFAULT (getdate()) FOR [Notes_Date]
GO
ALTER TABLE [dbo].[H_tblNotes] ADD  CONSTRAINT [DF_tblNotes_User_Id_H]  DEFAULT ('system') FOR [User_Id]
GO
