USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[tbl_Forum]    Script Date: 6/17/2019 2:22:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Forum](
	[Forums_ID] [int] IDENTITY(1,1) NOT NULL,
	[Forum_Name] [varchar](200) NOT NULL,
	[DomainId] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
