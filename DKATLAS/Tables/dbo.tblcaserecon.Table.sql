USE [DKATLAS]
GO
/****** Object:  Table [dbo].[tblcaserecon]    Script Date: 6/17/2019 2:53:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblcaserecon](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[case_id] [nvarchar](50) NULL,
	[facs_Acct] [nvarchar](100) NULL,
	[ACCT#_From_clt] [varchar](100) NULL,
	[Product_Line] [nvarchar](100) NULL
) ON [PRIMARY]
GO
