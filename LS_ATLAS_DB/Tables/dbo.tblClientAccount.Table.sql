USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[tblClientAccount]    Script Date: 6/17/2019 2:22:50 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblClientAccount](
	[Account_Id] [int] IDENTITY(1,1) NOT NULL,
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
	[Expense_Due] [money] NULL,
 CONSTRAINT [PK_tblClientAccount] PRIMARY KEY CLUSTERED 
(
	[Account_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblClientAccount] ADD  DEFAULT ('h1') FOR [DomainId]
GO
