USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[TXN_ASSIGN_SETTLED_CASES]    Script Date: 6/17/2019 2:22:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TXN_ASSIGN_SETTLED_CASES](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CASE_ID] [nvarchar](100) NOT NULL,
	[USER_ID] [nvarchar](100) NOT NULL,
	[DATE_CHANGED] [datetime] NOT NULL,
	[isChanged] [int] NOT NULL,
	[DomainId] [nvarchar](512) NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TXN_ASSIGN_SETTLED_CASES] ADD  DEFAULT ('h1') FOR [DomainId]
GO
