USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[tblInsuranceGroups]    Script Date: 6/17/2019 2:22:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblInsuranceGroups](
	[GroupName] [varchar](100) NOT NULL,
	[DomainId] [nvarchar](512) NOT NULL,
 CONSTRAINT [PK_tblInsuranceGroups] PRIMARY KEY CLUSTERED 
(
	[GroupName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblInsuranceGroups] ADD  DEFAULT ('h1') FOR [DomainId]
GO
