USE [DKATLAS]
GO
/****** Object:  Table [dbo].[RelationProv_BatchNo]    Script Date: 6/17/2019 2:53:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RelationProv_BatchNo](
	[Auto_id] [int] IDENTITY(1,1) NOT NULL,
	[BatchNumber] [nvarchar](50) NULL,
	[ProviderId] [nvarchar](50) NULL
) ON [PRIMARY]
GO
