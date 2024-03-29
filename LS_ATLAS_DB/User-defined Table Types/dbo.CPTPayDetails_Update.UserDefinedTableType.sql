USE [LS_ATLAS_DB]
GO
/****** Object:  UserDefinedTableType [dbo].[CPTPayDetails_Update]    Script Date: 6/17/2019 2:31:13 AM ******/
CREATE TYPE [dbo].[CPTPayDetails_Update] AS TABLE(
	[TCPT_ATUO_ID] [int] NULL,
	[TPrev_Collected_Amount] [decimal](18, 2) NULL,
	[TCurrent_Paid] [decimal](18, 2) NULL,
	[TPrev_Deductible] [decimal](18, 2) NULL,
	[TDeductible] [decimal](18, 2) NULL,
	[TPrev_Intrest] [decimal](18, 2) NULL,
	[TInterest_Paid] [decimal](18, 2) NULL,
	[TPrev_AttorneyFee] [decimal](18, 2) NULL,
	[TAttorneyFee] [decimal](18, 2) NULL,
	[TCase_ID] [nvarchar](50) NULL,
	[TCreated_By] [nvarchar](500) NULL,
	[TDomainID] [nvarchar](50) NULL,
	[TPayment_Id] [int] NULL
)
GO
