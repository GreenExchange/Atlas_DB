USE [DKATLAS]
GO
/****** Object:  Table [dbo].[tblTreatment]    Script Date: 6/17/2019 2:53:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTreatment](
	[Treatment_Id] [int] IDENTITY(1,1) NOT NULL,
	[Case_Id] [nvarchar](100) NULL,
	[DateOfService_Start] [datetime] NULL,
	[DateOfService_End] [datetime] NULL,
	[Claim_Amount] [numeric](19, 2) NULL,
	[Paid_Amount] [numeric](19, 2) NULL,
	[Date_BillSent] [datetime] NULL,
	[SERVICE_TYPE] [nvarchar](100) NULL,
	[DENIALREASONS_TYPE] [nvarchar](100) NULL,
	[Settlement_Pctg] [float] NULL,
	[Interest_Pctg] [float] NULL,
	[AttorneyFee] [float] NULL,
	[FilingFeeAmt] [float] NULL,
	[SettlementInt] [float] NULL,
	[CPT_Id] [int] NULL,
	[BX_BILL_ID] [int] NULL,
	[Date_Created] [datetime] NULL,
	[Doctor_Id] [int] NULL,
	[Litigation_Status] [int] NULL,
	[account_number] [varchar](20) NULL,
	[BILL_NUMBER] [varchar](100) NULL,
	[Action_Type] [varchar](100) NULL,
	[Operating_Doctor] [varchar](100) NULL,
	[Fee_Schedule] [numeric](18, 2) NULL,
	[DENIALREASONS_TYPE1] [varchar](100) NULL,
	[DenialReason_ID] [int] NULL,
	[PeerReviewDoctor_ID] [int] NULL,
	[TreatingDoctor_ID] [int] NULL,
	[DocumentStatus] [varchar](100) NULL,
	[ACT_CASE_ID] [varchar](100) NULL,
 CONSTRAINT [PK_tblTreatment] PRIMARY KEY CLUSTERED 
(
	[Treatment_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblTreatment] ADD  CONSTRAINT [DF_tblTreatment_Date_Created]  DEFAULT (getdate()) FOR [Date_Created]
GO
