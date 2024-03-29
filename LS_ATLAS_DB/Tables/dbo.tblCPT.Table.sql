USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[tblCPT]    Script Date: 6/17/2019 2:22:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCPT](
	[CPT_Id] [int] IDENTITY(1,1) NOT NULL,
	[CPT_Code] [nvarchar](50) NOT NULL,
	[CPT_Name] [nvarchar](300) NULL,
	[Amount] [money] NULL,
	[DomainId] [nvarchar](512) NOT NULL,
 CONSTRAINT [PK_tblCPT] PRIMARY KEY CLUSTERED 
(
	[CPT_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblCPT] ADD  DEFAULT ('h1') FOR [DomainId]
GO
