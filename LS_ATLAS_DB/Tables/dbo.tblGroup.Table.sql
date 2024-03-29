USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[tblGroup]    Script Date: 6/17/2019 2:22:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblGroup](
	[Group_Id] [int] IDENTITY(1,1) NOT NULL,
	[Group_CreateDate] [datetime] NOT NULL,
	[Group_All] [nvarchar](1000) NULL,
	[DomainId] [nvarchar](512) NOT NULL,
 CONSTRAINT [PK_tblGroup] PRIMARY KEY CLUSTERED 
(
	[Group_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblGroup] ADD  CONSTRAINT [DF_tblGroup_Group_CreateDate]  DEFAULT (getdate()) FOR [Group_CreateDate]
GO
ALTER TABLE [dbo].[tblGroup] ADD  DEFAULT ('h1') FOR [DomainId]
GO
