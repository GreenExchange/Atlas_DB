USE [DKATLAS]
GO
/****** Object:  Table [dbo].[tblClientPayment]    Script Date: 6/17/2019 2:53:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblClientPayment](
	[ClientPaymentId] [int] IDENTITY(1,1) NOT NULL,
	[Provider_id] [varchar](50) NOT NULL,
	[Payment_Amount] [money] NOT NULL,
	[Payment_Date] [datetime] NOT NULL,
	[Payment_Desc] [nvarchar](2500) NULL
) ON [PRIMARY]
GO
