USE [LS_ATLAS_DB]
GO
/****** Object:  UserDefinedTableType [dbo].[ExcelImportTypes]    Script Date: 6/17/2019 2:31:14 AM ******/
CREATE TYPE [dbo].[ExcelImportTypes] AS TABLE(
	[Provider] [varchar](100) NULL,
	[Portfolio] [varchar](100) NULL,
	[PurchaseDate] [datetime] NULL,
	[Insured] [varchar](100) NULL,
	[InsCompany] [varchar](100) NULL,
	[ClaimNo] [varchar](100) NULL,
	[DOL] [datetime] NULL,
	[DOS] [datetime] NULL,
	[DOFN] [datetime] NULL,
	[InvoiceAmt] [varchar](100) NULL,
	[PartialPmts] [varchar](100) NULL,
	[CaseNo] [varchar](100) NULL,
	[FilingDate] [datetime] NULL,
	[Attorney] [varchar](100) NULL,
	[County_Filed] [varchar](100) NULL,
	[Settled_Date] [datetime] NULL,
	[Paid_Date] [datetime] NULL,
	[Paid_Amount] [varchar](100) NULL,
	[Notes] [varchar](100) NULL,
	[Status] [varchar](100) NULL,
	[PortfolioId] [varchar](100) NULL
)
GO
