USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[MST_Service_Rendered_Location]    Script Date: 6/17/2019 2:22:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MST_Service_Rendered_Location](
	[Location_Id] [int] IDENTITY(1,1) NOT NULL,
	[Provider_Id] [int] NULL,
	[Location_Address] [varchar](200) NULL,
	[Location_City] [varchar](100) NULL,
	[Location_State] [varchar](100) NULL,
	[Location_Zip] [varchar](10) NULL,
	[DomainId] [nvarchar](512) NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[MST_Service_Rendered_Location] ADD  DEFAULT ('h1') FOR [DomainId]
GO
