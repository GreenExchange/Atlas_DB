USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[tblProcess]    Script Date: 6/17/2019 2:22:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProcess](
	[Process_Id] [int] IDENTITY(1,1) NOT NULL,
	[Process_Name] [varchar](100) NOT NULL,
	[Process_Desc] [nvarchar](300) NULL,
	[Process_SQL] [nvarchar](500) NULL,
	[Process_Debug] [bit] NULL,
	[Process_Date] [datetime] NULL,
	[Process_SQLFields] [nvarchar](500) NULL,
	[Template] [nvarchar](100) NULL,
	[Replacements] [nvarchar](100) NULL,
	[Copies] [int] NULL,
	[Exhibits] [bit] NULL,
	[DomainId] [nvarchar](512) NOT NULL,
 CONSTRAINT [pkProcessID] PRIMARY KEY CLUSTERED 
(
	[Process_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblProcess] ADD  DEFAULT ('h1') FOR [DomainId]
GO
