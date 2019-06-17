USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[tblREJECTION_REQUEST]    Script Date: 6/17/2019 2:22:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblREJECTION_REQUEST](
	[AUTO_ID] [int] IDENTITY(1,1) NOT NULL,
	[CASE_ID] [nvarchar](50) NOT NULL,
	[LIST_ID] [int] NOT NULL,
	[DomainId] [nvarchar](512) NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblREJECTION_REQUEST] ADD  DEFAULT ('h1') FOR [DomainId]
GO
