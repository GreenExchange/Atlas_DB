USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[tblPayment]    Script Date: 6/17/2019 2:22:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPayment](
	[Payment_Id] [int] IDENTITY(1,1) NOT NULL,
	[Provider_Id] [nvarchar](50) NULL,
	[Payment_Amount] [money] NULL,
	[Payment_Date] [datetime] NULL,
	[Payment_Desc] [nvarchar](500) NULL,
	[Payment_Type] [varchar](10) NULL,
	[User_id] [varchar](50) NULL,
	[DomainId] [nvarchar](512) NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblPayment] ADD  DEFAULT ('h1') FOR [DomainId]
GO
