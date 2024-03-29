USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[BILLS_WITH_PROCEDURE_CODES]    Script Date: 6/17/2019 2:22:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BILLS_WITH_PROCEDURE_CODES](
	[Account] [varchar](255) NULL,
	[BillNumber] [varchar](255) NULL,
	[Code] [varchar](50) NULL,
	[Description] [varchar](255) NULL,
	[Amount] [float] NULL,
	[DOS] [datetime] NULL,
	[Specialty] [varchar](255) NULL,
	[BillAmount] [float] NULL,
	[ins_fee_schedule] [money] NULL,
	[CPT_ATUO_ID] [int] IDENTITY(1,1) NOT NULL,
	[Case_ID] [varchar](50) NULL,
	[fk_Treatment_Id] [int] NULL,
	[DomainID] [varchar](50) NOT NULL,
	[created_by_user] [nvarchar](255) NOT NULL,
	[created_date] [datetime] NULL,
	[modified_by_user] [nvarchar](255) NULL,
	[modified_date] [datetime] NULL,
	[CollectedAmount] [decimal](18, 2) NULL,
	[ICD10_3] [varchar](100) NULL,
	[ICD10_2] [varchar](100) NULL,
	[ICD10_1] [varchar](100) NULL,
	[MOD] [int] NULL,
	[UNITS] [int] NULL,
	[Deductible] [float] NULL,
	[Intrest] [float] NULL,
	[AttorneyFee] [float] NULL,
	[LITCollectedAmount] [decimal](18, 2) NULL,
	[LITIntrest] [decimal](18, 2) NULL,
	[LITFees] [decimal](18, 2) NULL,
	[CourtFees] [decimal](18, 2) NULL,
	[Purchase_Freeze_Date] [datetime] NULL,
	[Bill_Adjustment] [float] NULL,
	[Refund_Freeze_Date] [datetime] NULL,
	[GP_Freeze_Date] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BILLS_WITH_PROCEDURE_CODES] ADD  CONSTRAINT [DF__BILLS_WIT__Domai__71139959]  DEFAULT ('p') FOR [DomainID]
GO
ALTER TABLE [dbo].[BILLS_WITH_PROCEDURE_CODES] ADD  CONSTRAINT [DF__BILLS_WIT__creat__7207BD92]  DEFAULT ('admin') FOR [created_by_user]
GO
ALTER TABLE [dbo].[BILLS_WITH_PROCEDURE_CODES] ADD  CONSTRAINT [DF_BILLS_WITH_PROCEDURE_CODES_MOD]  DEFAULT ((0)) FOR [MOD]
GO
ALTER TABLE [dbo].[BILLS_WITH_PROCEDURE_CODES] ADD  CONSTRAINT [DF_BILLS_WITH_PROCEDURE_CODES_UNITS]  DEFAULT ((1)) FOR [UNITS]
GO
