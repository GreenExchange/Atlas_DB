USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[Report_Send_Details]    Script Date: 6/17/2019 2:22:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Report_Send_Details](
	[Autoid] [int] IDENTITY(1,1) NOT NULL,
	[Provider] [varchar](500) NULL,
	[Report_Send_Date] [datetime] NULL,
	[Filename] [varchar](500) NULL,
	[DomainID] [varchar](512) NULL,
	[Generated_By] [int] NULL,
	[Report_Send_Id] [int] NOT NULL
) ON [PRIMARY]
GO
