USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[tblclientaccount_deleted]    Script Date: 6/17/2019 2:22:50 AM ******/
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
	[Prev_Cost_Balance] [money] NULL,
	[DomainId] [nvarchar](512) NOT NULL,
	[VENDOR_FEE] [money] NULL,
	[Intrest_Due] [money] NULL,
	[Expense_Due] [money] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblclientaccount_deleted] ADD  DEFAULT ('h1') FOR [DomainId]
GO
