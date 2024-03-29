USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[tblcaserecon]    Script Date: 6/17/2019 2:22:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblcaserecon](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[case_id] [nvarchar](50) NULL,
	[facs_Acct] [nvarchar](100) NULL,
	[ACCT#_From_clt] [varchar](100) NULL,
	[Product_Line] [nvarchar](100) NULL,
	[DomainId] [nvarchar](512) NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblcaserecon] ADD  DEFAULT ('h1') FOR [DomainId]
GO
