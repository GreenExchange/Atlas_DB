USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[tblDocs]    Script Date: 6/17/2019 2:22:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDocs](
	[Doc_Id] [int] IDENTITY(1,1) NOT NULL,
	[Doc_Name] [nvarchar](500) NULL,
	[Doc_Value] [nvarchar](500) NULL,
	[Settlement] [bit] NULL,
	[DomainId] [nvarchar](512) NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblDocs] ADD  CONSTRAINT [DF_tblDocs_Settlement]  DEFAULT ((0)) FOR [Settlement]
GO
ALTER TABLE [dbo].[tblDocs] ADD  DEFAULT ('h1') FOR [DomainId]
GO
