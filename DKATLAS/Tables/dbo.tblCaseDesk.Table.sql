USE [DKATLAS]
GO
/****** Object:  Table [dbo].[tblCaseDesk]    Script Date: 6/17/2019 2:53:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCaseDesk](
	[Case_Id] [varchar](50) NULL,
	[Desk_Id] [int] NULL,
	[Desk_Reason] [nvarchar](500) NULL
) ON [PRIMARY]
GO
