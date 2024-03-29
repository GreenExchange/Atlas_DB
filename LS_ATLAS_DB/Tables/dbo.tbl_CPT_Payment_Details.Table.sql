USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[tbl_CPT_Payment_Details]    Script Date: 6/17/2019 2:22:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_CPT_Payment_Details](
	[CPT_Pay_Id] [int] IDENTITY(1,1) NOT NULL,
	[CPT_ATUO_ID] [int] NULL,
	[CPT_Code] [decimal](18, 0) NULL,
	[Description] [nvarchar](500) NULL,
	[Case_ID] [nvarchar](50) NULL,
	[Prev_Collected_Amount] [decimal](18, 2) NULL,
	[Current_Paid] [decimal](18, 2) NULL,
	[Created_By] [nvarchar](500) NULL,
	[Created_Date] [datetime] NULL,
	[Modified_By] [nvarchar](500) NULL,
	[Modified_Date] [datetime] NULL,
	[Domainid] [nvarchar](50) NULL,
	[Transaction_Id] [int] NULL,
	[Current_Interest] [decimal](18, 2) NULL,
	[Prev_Deductible] [decimal](18, 2) NULL,
	[Current_Deductible] [decimal](18, 2) NULL,
	[Prev_Intrest] [decimal](18, 2) NULL,
	[Prev_AttorneyFee] [decimal](18, 2) NULL,
	[Current_AttorneyFee] [decimal](18, 2) NULL,
	[Prev_LIT_Collected_Amount] [decimal](18, 2) NULL,
	[Current_LIT_Paid] [decimal](18, 2) NULL,
	[Prev_LIT_Intrest] [decimal](18, 2) NULL,
	[Current_LIT_Interest] [decimal](18, 2) NULL,
	[Prev_LIT_Fees] [decimal](18, 2) NULL,
	[Current_LIT_Fees] [decimal](18, 2) NULL,
	[Prev_LIT_CourtFee] [decimal](18, 2) NULL,
	[Current_LIT_CourtFee] [decimal](18, 2) NULL,
	[VAL_PAY_Freeze_Date] [datetime] NULL,
	[LIT_PAY_Freeze_Date] [datetime] NULL,
	[VAL_Cleared_Date] [datetime] NULL,
	[LIT_Cleared_Date] [datetime] NULL
) ON [PRIMARY]
GO
