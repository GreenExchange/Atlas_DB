USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[tblNotesType]    Script Date: 6/17/2019 2:22:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblNotesType](
	[NotesType_Id] [int] IDENTITY(1,1) NOT NULL,
	[Notes_Type] [nvarchar](50) NULL,
	[Notes_Type_Color] [nvarchar](50) NULL,
	[DomainId] [nvarchar](512) NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblNotesType] ADD  DEFAULT ('h1') FOR [DomainId]
GO
