USE [DKATLAS]
GO
/****** Object:  Table [dbo].[tblworddocs]    Script Date: 6/17/2019 2:53:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblworddocs](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NAME] [nvarchar](50) NULL,
	[VALUE] [nvarchar](50) NULL
) ON [PRIMARY]
GO
