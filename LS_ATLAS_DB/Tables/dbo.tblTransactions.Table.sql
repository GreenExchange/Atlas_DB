USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[tblTransactions]    Script Date: 6/17/2019 2:22:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTransactions](
	[Transactions_Id] [int] IDENTITY(1,1) NOT NULL,
	[Case_Id] [nvarchar](50) NOT NULL,
	[Transactions_Type] [nvarchar](20) NOT NULL,
	[Transactions_Date] [smalldatetime] NOT NULL,
	[Transactions_Amount] [money] NOT NULL,
	[Transactions_Description] [nvarchar](255) NULL,
	[Provider_Id] [nvarchar](50) NOT NULL,
	[User_Id] [varchar](50) NOT NULL,
	[Transactions_Fee] [money] NOT NULL,
	[Transactions_status] [varchar](50) NULL,
	[Invoice_Id] [int] NULL,
	[Rfund_Deposite_Amount] [numeric](18, 2) NULL,
	[Rfund_Deposite_Number] [varchar](50) NULL,
	[Rfund_Batch] [int] NULL,
	[Rfund_Settled_Amount] [numeric](18, 2) NULL,
	[FF_Paid_By] [varchar](50) NULL,
	[Posted_Date] [datetime] NULL,
	[DomainId] [nvarchar](512) NOT NULL,
	[ChequeNo] [nvarchar](50) NULL,
	[CheckDate] [datetime] NULL,
	[BatchNo] [varchar](100) NULL,
	[TreatmentIds] [varchar](500) NULL,
	[Transactions_Id_OLD] [int] NULL,
 CONSTRAINT [PK_tblTransactions] PRIMARY KEY CLUSTERED 
(
	[Case_Id] ASC,
	[Transactions_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblTransactions] ADD  CONSTRAINT [DF_tblTransactions_Transactions_Fee]  DEFAULT ((0.00)) FOR [Transactions_Fee]
GO
ALTER TABLE [dbo].[tblTransactions] ADD  CONSTRAINT [DF_tblTransactions_Invoice_Id]  DEFAULT ((0)) FOR [Invoice_Id]
GO
ALTER TABLE [dbo].[tblTransactions] ADD  CONSTRAINT [DF_tblTransactions_Posted_Date]  DEFAULT (getdate()) FOR [Posted_Date]
GO
ALTER TABLE [dbo].[tblTransactions] ADD  CONSTRAINT [DF__tblTransa__Domai__0B27A5C0]  DEFAULT ('h1') FOR [DomainId]
GO
