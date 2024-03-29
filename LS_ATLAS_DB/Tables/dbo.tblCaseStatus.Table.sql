USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[tblCaseStatus]    Script Date: 6/17/2019 2:22:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCaseStatus](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[description] [nvarchar](200) NULL,
	[DomainId] [nvarchar](50) NOT NULL,
	[created_by_user] [nvarchar](255) NOT NULL,
	[created_date] [datetime] NULL,
	[modified_by_user] [nvarchar](255) NULL,
	[modified_date] [datetime] NULL,
 CONSTRAINT [PK_tblCaseStatus] PRIMARY KEY NONCLUSTERED 
(
	[DomainId] ASC,
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblCaseStatus] ADD  CONSTRAINT [DF__tblCaseSt__Domai__318258D2]  DEFAULT ('h1') FOR [DomainId]
GO
ALTER TABLE [dbo].[tblCaseStatus] ADD  CONSTRAINT [DF__tblCaseSt__creat__494FC0C2]  DEFAULT ('admin') FOR [created_by_user]
GO
ALTER TABLE [dbo].[tblCaseStatus] ADD  CONSTRAINT [DF_tblCaseStatus_created_date]  DEFAULT (getdate()) FOR [created_date]
GO
