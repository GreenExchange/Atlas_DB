USE [DKATLAS]
GO
/****** Object:  Table [dbo].[TblPending_Audit]    Script Date: 6/17/2019 2:53:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblPending_Audit](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PROCESSOR_NAME] [varchar](50) NOT NULL,
	[CASE_COUNT] [int] NOT NULL,
	[DateCreated] [datetime] NOT NULL
) ON [PRIMARY]
GO
