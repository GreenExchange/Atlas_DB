USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[AFData]    Script Date: 6/17/2019 2:22:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AFData](
	[case_id] [nvarchar](200) NULL,
	[InjuredParty_FirstName] [nvarchar](100) NULL,
	[InjuredParty_LastName] [nvarchar](100) NULL,
	[DOS_start] [datetime] NULL,
	[claim] [money] NULL,
	[fee_schedule] [money] NULL,
	[paid] [money] NULL,
	[claim_bal] [money] NULL,
	[fee_bal] [money] NULL,
	[bill_no] [nvarchar](100) NULL,
	[claim_no] [nvarchar](50) NULL,
	[ins_name] [nvarchar](100) NULL
) ON [PRIMARY]
GO
