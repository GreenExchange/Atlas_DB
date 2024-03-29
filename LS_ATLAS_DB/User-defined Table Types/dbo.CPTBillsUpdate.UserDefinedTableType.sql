USE [LS_ATLAS_DB]
GO
/****** Object:  UserDefinedTableType [dbo].[CPTBillsUpdate]    Script Date: 6/17/2019 2:31:12 AM ******/
CREATE TYPE [dbo].[CPTBillsUpdate] AS TABLE(
	[TCPT_ATUO_ID] [int] NULL,
	[TCollectedAmount] [decimal](18, 2) NULL,
	[TDeductible] [decimal](18, 2) NULL,
	[TIntrest] [decimal](18, 2) NULL,
	[TAttorneyFee] [decimal](18, 2) NULL,
	[TDomainID] [nvarchar](50) NULL
)
GO
