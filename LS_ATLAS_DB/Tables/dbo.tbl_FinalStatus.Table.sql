USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[tbl_FinalStatus]    Script Date: 6/17/2019 2:22:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_FinalStatus](
	[FinalStatus_ID] [int] IDENTITY(1,1) NOT NULL,
	[FinalStatus_Name] [varchar](200) NOT NULL,
	[DomainId] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
