USE [DKATLAS]
GO
/****** Object:  Table [dbo].[tblProviderFinancial]    Script Date: 6/17/2019 2:53:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProviderFinancial](
	[Srl_No] [int] IDENTITY(1,1) NOT NULL,
	[Provider_Id] [nvarchar](100) NULL
) ON [PRIMARY]
GO
