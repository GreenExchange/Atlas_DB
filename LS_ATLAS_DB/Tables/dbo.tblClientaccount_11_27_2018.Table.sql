USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[tblClientaccount_11_27_2018]    Script Date: 6/17/2019 2:22:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblClientaccount_11_27_2018](
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
	[DomainId] [nvarchar](512) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
