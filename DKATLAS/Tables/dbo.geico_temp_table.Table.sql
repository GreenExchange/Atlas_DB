USE [DKATLAS]
GO
/****** Object:  Table [dbo].[geico_temp_table]    Script Date: 6/17/2019 2:53:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[geico_temp_table](
	[Settlement_amount] [money] NULL,
	[Settlement_int] [money] NULL,
	[settlement_af] [money] NULL,
	[settlement_ff] [money] NULL,
	[settlement_total] [money] NULL,
	[settlement_date] [datetime] NULL,
	[case_id] [varchar](50) NULL,
	[user_id] [varchar](50) NULL,
	[settledwith] [varchar](50) NULL,
	[settlement_notes] [varchar](500) NULL,
	[settlement_batch] [varchar](50) NULL,
	[settlement_subbatch] [varchar](50) NULL
) ON [PRIMARY]
GO
