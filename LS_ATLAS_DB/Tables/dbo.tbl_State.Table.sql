USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[tbl_State]    Script Date: 6/17/2019 2:22:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_State](
	[Id] [tinyint] IDENTITY(1,1) NOT NULL,
	[StateCode] [nvarchar](2) NOT NULL,
	[StateText] [nvarchar](50) NOT NULL,
	[CountryId] [tinyint] NOT NULL,
	[DomainId] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
