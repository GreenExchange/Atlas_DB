USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[tblRTFNotes]    Script Date: 6/17/2019 2:22:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRTFNotes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Notes_Desc] [nvarchar](2000) NULL,
	[Notes_Date] [smalldatetime] NULL,
	[template_name] [varchar](200) NULL,
	[User_Id] [nvarchar](50) NULL,
	[DomainId] [nvarchar](512) NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblRTFNotes] ADD  DEFAULT ('h1') FOR [DomainId]
GO
