USE [DKATLAS]
GO
/****** Object:  Table [dbo].[tblImageTypes]    Script Date: 6/17/2019 2:53:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblImageTypes](
	[Image_Id] [int] IDENTITY(1,1) NOT NULL,
	[Image_Type] [nvarchar](100) NULL
) ON [PRIMARY]
GO
