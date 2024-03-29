USE [DKATLAS]
GO
/****** Object:  Table [dbo].[tblSettlement_Type]    Script Date: 6/17/2019 2:53:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSettlement_Type](
	[SettlementType_Id] [int] IDENTITY(1,1) NOT NULL,
	[Settlement_Type] [nvarchar](500) NULL,
	[created_by_user] [nvarchar](255) NOT NULL,
	[created_date] [datetime] NULL,
	[modified_by_user] [nvarchar](255) NULL,
	[modified_date] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblSettlement_Type] ADD  DEFAULT ('admin') FOR [created_by_user]
GO
