USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[tblDateFields]    Script Date: 6/17/2019 2:22:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDateFields](
	[date_auto_id] [int] IDENTITY(1,1) NOT NULL,
	[Date_Field_Name] [nvarchar](200) NULL,
	[Date_Field_Desc] [nvarchar](200) NULL,
	[DomainId] [varchar](50) NULL,
	[TableFrom] [varchar](100) NULL
) ON [PRIMARY]
GO
