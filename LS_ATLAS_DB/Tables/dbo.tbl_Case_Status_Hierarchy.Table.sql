USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[tbl_Case_Status_Hierarchy]    Script Date: 6/17/2019 2:22:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Case_Status_Hierarchy](
	[DomainID] [varchar](50) NULL,
	[status] [nvarchar](100) NULL,
	[Case_id] [nvarchar](50) NULL,
	[Case_Auto_Id] [int] NULL,
	[Audit_Command] [varchar](20) NULL,
	[Audit_TimeStamp] [datetime] NULL,
	[USER_NAME] [nvarchar](100) NULL
) ON [PRIMARY]
GO
