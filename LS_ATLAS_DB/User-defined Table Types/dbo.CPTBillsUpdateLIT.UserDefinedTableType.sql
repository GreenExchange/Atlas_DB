USE [LS_ATLAS_DB]
GO
/****** Object:  UserDefinedTableType [dbo].[CPTBillsUpdateLIT]    Script Date: 6/17/2019 2:31:13 AM ******/
CREATE TYPE [dbo].[CPTBillsUpdateLIT] AS TABLE(
	[TCPT_ATUO_ID] [int] NULL,
	[TLITCollectedAmount] [decimal](18, 2) NULL,
	[TLITIntrest] [decimal](18, 2) NULL,
	[TLITFees] [decimal](18, 2) NULL,
	[TCourtFees] [decimal](18, 2) NULL,
	[TDomainID] [nvarchar](50) NULL
)
GO
