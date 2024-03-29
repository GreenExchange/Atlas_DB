USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[tblClientPayment]    Script Date: 6/17/2019 2:22:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblClientPayment](
	[ClientPaymentId] [int] IDENTITY(1,1) NOT NULL,
	[Provider_id] [varchar](50) NOT NULL,
	[Payment_Amount] [money] NOT NULL,
	[Payment_Date] [datetime] NOT NULL,
	[Payment_Desc] [nvarchar](2500) NULL,
	[DomainId] [nvarchar](512) NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblClientPayment] ADD  DEFAULT ('h1') FOR [DomainId]
GO
