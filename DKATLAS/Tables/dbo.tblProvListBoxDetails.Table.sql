USE [DKATLAS]
GO
/****** Object:  Table [dbo].[tblProvListBoxDetails]    Script Date: 6/17/2019 2:53:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProvListBoxDetails](
	[Batch_AutoId] [int] IDENTITY(1,1) NOT NULL,
	[Batch_No] [varchar](100) NULL,
	[Provider_ID] [varchar](100) NULL,
	[No_Of_Cases] [varchar](200) NULL,
	[Created_By_User] [nvarchar](50) NOT NULL,
	[Created_Date] [datetime] NULL,
	[Modified_By_User] [nvarchar](50) NULL,
	[Modified_Date] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblProvListBoxDetails] ADD  DEFAULT ('admin') FOR [Created_By_User]
GO
