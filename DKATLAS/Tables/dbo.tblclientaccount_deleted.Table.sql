USE [DKATLAS]
GO
/****** Object:  Table [dbo].[tblclientaccount_deleted]    Script Date: 6/17/2019 2:53:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblclientaccount_deleted](
	[Account_Id] [int] NULL,
	[Provider_Id] [varchar](50) NULL,
	[Gross_Amount] [money] NULL,
	[Firm_Fees] [money] NULL,
	[Cost_Balance] [money] NULL,
	[Applied_Cost] [money] NULL,
	[Final_Remit] [money] NULL,
	[Account_Date] [datetime] NULL,
	[Invoice_Image] [ntext] NULL,
	[Last_Printed] [datetime] NULL,
	[Prev_Cost_Balance] [money] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
