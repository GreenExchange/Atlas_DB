USE [LS_ATLAS_DB]
GO
/****** Object:  UserDefinedTableType [dbo].[CPTPayDetailsLIT]    Script Date: 6/17/2019 2:31:14 AM ******/
CREATE TYPE [dbo].[CPTPayDetailsLIT] AS TABLE(
	[TCPT_ATUO_ID] [int] NULL,
	[TPrev_LIT_Collected_Amount] [decimal](18, 2) NULL,
	[TCurrent_LIT_Paid] [decimal](18, 2) NULL,
	[TPrev_LIT_Intrest] [decimal](18, 2) NULL,
	[TLITIntrest] [decimal](18, 2) NULL,
	[TPrev_LIT_Fees] [decimal](18, 2) NULL,
	[TLITFees] [decimal](18, 2) NULL,
	[TPrev_LIT_CourtFee] [decimal](18, 2) NULL,
	[TCourtFees] [decimal](18, 2) NULL,
	[TCase_ID] [nvarchar](50) NULL,
	[TCreated_By] [nvarchar](500) NULL,
	[TDomainID] [nvarchar](50) NULL,
	[TPayment_Id] [int] NULL
)
GO
