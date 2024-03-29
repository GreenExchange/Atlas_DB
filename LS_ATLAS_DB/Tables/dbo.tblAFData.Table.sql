USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[tblAFData]    Script Date: 6/17/2019 2:22:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAFData](
	[CASE_ID] [varchar](50) NULL,
	[BILL_NUMBER] [varchar](50) NULL,
	[Claim_Amount] [float] NULL,
	[Paid_Amount] [float] NULL,
	[Fee_Schedule] [float] NULL,
	[Date_Bill_Sent] [datetime] NULL,
	[Settlemnt_Amount] [float] NULL,
	[Settlemnt_Int] [float] NULL,
	[Packeted_Case_ID] [varchar](50) NULL,
	[DATE_AAA_ARB_FILED] [datetime] NULL,
	[Provider_Group] [varchar](200) NULL,
	[Status] [varchar](200) NULL,
	[Status_ACT] [varchar](200) NULL,
	[Payment_Amount_C] [float] NULL,
	[Payment_Amount_I] [float] NULL,
	[Payment_Amount_AF] [float] NULL,
	[Settlemnt_AF] [float] NULL,
	[vol_date] [datetime] NULL,
	[Col_date] [datetime] NULL
) ON [PRIMARY]
GO
