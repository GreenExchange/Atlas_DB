USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[tblStates]    Script Date: 6/17/2019 2:22:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblStates](
	[State_Id] [int] IDENTITY(1,1) NOT NULL,
	[State_Name] [varchar](100) NULL,
	[State_Abr] [varchar](2) NULL,
	[DomainId] [nvarchar](512) NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblStates] ADD  DEFAULT ('h1') FOR [DomainId]
GO
