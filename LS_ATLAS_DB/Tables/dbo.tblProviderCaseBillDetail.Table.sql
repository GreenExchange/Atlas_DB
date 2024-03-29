USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[tblProviderCaseBillDetail]    Script Date: 6/17/2019 2:22:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProviderCaseBillDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DateOfService_Start] [datetime] NULL,
	[DateOfService_End] [datetime] NULL,
	[Claim_Amount] [varchar](100) NULL,
	[Paid_Amount] [varchar](100) NULL,
	[Fee_Schedule] [numeric](18, 2) NULL,
	[Date_BillSent] [varchar](250) NULL,
	[DenialReasons_Type] [nvarchar](50) NULL,
	[BILL_NUMBER] [varchar](100) NULL,
	[SERVICE_TYPE] [varchar](100) NULL,
	[TreatingDoctor_ID] [int] NULL,
	[Action_Type] [varchar](100) NULL,
	[PeerReviewDoctor_ID] [int] NULL,
	[Case_Id] [nvarchar](50) NULL,
	[DomainId] [nvarchar](50) NOT NULL,
	[Account_Number] [varchar](50) NULL,
	[DenialReason_ID] [int] NULL
) ON [PRIMARY]
GO
