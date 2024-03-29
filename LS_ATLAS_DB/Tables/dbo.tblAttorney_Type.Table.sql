USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[tblAttorney_Type]    Script Date: 6/17/2019 2:22:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAttorney_Type](
	[Attorney_Type_ID] [int] IDENTITY(1,1) NOT NULL,
	[Attorney_Type] [varchar](100) NOT NULL,
	[DomainID] [varchar](50) NOT NULL,
	[created_by_user] [nvarchar](255) NULL,
	[created_date] [datetime] NULL,
	[modified_by_user] [nvarchar](255) NULL,
	[modified_date] [datetime] NULL
) ON [PRIMARY]
GO
