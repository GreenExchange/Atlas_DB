USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[AMT]    Script Date: 6/17/2019 2:22:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AMT](
	[case_id] [nvarchar](255) NULL,
	[Claim_Amount] [float] NULL,
	[Paid_Amount] [nvarchar](255) NULL,
	[DateOfService_Start] [datetime] NULL,
	[DateOfService_End] [datetime] NULL,
	[SERVICE_TYPE] [nvarchar](255) NULL,
	[DomainId] [nvarchar](255) NULL,
	[Date_BillSent] [datetime] NULL
) ON [PRIMARY]
GO
