USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[tbl_City]    Script Date: 6/17/2019 2:22:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_City](
	[Id] [tinyint] IDENTITY(1,1) NOT NULL,
	[CityCode] [nvarchar](2) NOT NULL,
	[CityText] [nvarchar](50) NOT NULL,
	[StateId] [tinyint] NOT NULL,
	[DomainId] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
