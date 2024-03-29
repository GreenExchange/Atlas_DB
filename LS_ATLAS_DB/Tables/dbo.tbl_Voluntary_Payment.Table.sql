USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[tbl_Voluntary_Payment]    Script Date: 6/17/2019 2:22:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Voluntary_Payment](
	[Voluntary_Pay_Id] [int] IDENTITY(1,1) NOT NULL,
	[Case_Id] [varchar](50) NULL,
	[Total_Collection] [decimal](18, 2) NULL,
	[Deductible] [decimal](18, 2) NULL,
	[Pre_Interest] [decimal](18, 2) NULL,
	[Voluntary_AF] [decimal](18, 2) NULL,
	[Payment_Type] [varchar](10) NULL,
	[Litigated_Collection] [decimal](18, 2) NULL,
	[Litigated_Interest] [decimal](18, 2) NULL,
	[Litigation_Fees] [decimal](18, 2) NULL,
	[Court_Fees] [decimal](18, 2) NULL,
	[Check_Date] [datetime] NULL,
	[Check_No] [varchar](100) NULL,
	[Transaction_Date] [datetime] NULL,
	[Transaction_Description] [varchar](250) NULL,
	[DomainId] [varchar](50) NULL,
	[Transactions_Id] [int] NULL,
	[FirstParty_Litigation] [bit] NULL,
	[dTransactions_Id] [int] NULL,
	[iTransactions_Id] [int] NULL,
 CONSTRAINT [PK_tbl_Voluntary_Payment] PRIMARY KEY CLUSTERED 
(
	[Voluntary_Pay_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
