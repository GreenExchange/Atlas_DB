USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[tblNotesAAACases]    Script Date: 6/17/2019 2:22:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblNotesAAACases](
	[Notes_ID] [int] IDENTITY(1,1) NOT NULL,
	[Notes_Desc] [nvarchar](3000) NULL,
	[Case_Id] [nvarchar](100) NOT NULL,
	[Notes_Date] [datetime] NOT NULL,
	[User_Id] [nvarchar](50) NULL,
	[DomainId] [nvarchar](512) NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblNotesAAACases] ADD  DEFAULT (getdate()) FOR [Notes_Date]
GO
