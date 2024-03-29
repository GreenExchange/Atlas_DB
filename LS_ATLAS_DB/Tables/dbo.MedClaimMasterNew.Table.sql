USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[MedClaimMasterNew]    Script Date: 6/17/2019 2:22:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedClaimMasterNew](
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[Insurance] [varchar](50) NULL,
	[PreCTransactionPayment] [varchar](50) NULL,
	[PreCTransactionDate] [varchar](50) NULL,
	[PreCTransactionPayment2] [varchar](50) NULL,
	[PreCTransactionDate2] [varchar](50) NULL,
	[Deductible1] [varchar](50) NULL,
	[Deductible2] [varchar](50) NULL,
	[Interest1] [varchar](50) NULL,
	[Interest2] [varchar](50) NULL,
	[AttorneyFee1] [varchar](50) NULL,
	[AttorneyFee2] [varchar](50) NULL,
	[TotalLitigationCollection1] [varchar](50) NULL,
	[CourtFees 1] [varchar](50) NULL,
	[LitigationFees1] [varchar](50) NULL,
	[NetLitigationCollection] [varchar](50) NULL,
	[LitigationPaymentDate1] [varchar](50) NULL,
	[TotalLitigationCollection2] [varchar](50) NULL,
	[CourtFees2] [varchar](50) NULL,
	[LitigationFees2] [varchar](50) NULL,
	[NetLitigationCollection2] [varchar](50) NULL,
	[LitigationPaymentDate2] [varchar](50) NULL
) ON [PRIMARY]
GO
