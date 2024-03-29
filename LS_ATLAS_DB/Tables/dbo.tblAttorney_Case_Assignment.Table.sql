USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[tblAttorney_Case_Assignment]    Script Date: 6/17/2019 2:22:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAttorney_Case_Assignment](
	[Assignment_Id] [int] IDENTITY(1,1) NOT NULL,
	[Attorney_Type_Id] [nvarchar](50) NOT NULL,
	[Attorney_Id] [int] NOT NULL,
	[Case_Id] [nvarchar](50) NOT NULL,
	[DomainId] [nvarchar](512) NOT NULL,
	[created_by_user] [nvarchar](255) NOT NULL,
	[created_date] [datetime] NULL,
	[modified_by_user] [nvarchar](255) NULL,
	[modified_date] [datetime] NULL
) ON [PRIMARY]
GO
