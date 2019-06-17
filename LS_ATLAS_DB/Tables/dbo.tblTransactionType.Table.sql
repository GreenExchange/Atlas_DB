USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[tblTransactionType]    Script Date: 6/17/2019 2:22:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTransactionType](
	[autoid] [int] IDENTITY(1,1) NOT NULL,
	[payment_type] [varchar](100) NULL,
	[payment_value] [varchar](50) NULL,
	[Report_Type] [varchar](100) NULL
) ON [PRIMARY]
GO
