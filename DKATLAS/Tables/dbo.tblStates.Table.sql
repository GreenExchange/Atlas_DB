USE [DKATLAS]
GO
/****** Object:  Table [dbo].[tblStates]    Script Date: 6/17/2019 2:53:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblStates](
	[State_Id] [int] IDENTITY(1,1) NOT NULL,
	[State_Name] [varchar](100) NULL,
	[State_Abr] [varchar](2) NULL
) ON [PRIMARY]
GO
