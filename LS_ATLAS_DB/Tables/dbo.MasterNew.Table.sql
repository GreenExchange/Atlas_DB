USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[MasterNew]    Script Date: 6/17/2019 2:22:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MasterNew](
	[Provider] [varchar](500) NULL,
	[Portfolio] [varchar](50) NULL,
	[Purchase Date] [varchar](50) NULL,
	[Insured] [varchar](500) NULL,
	[Ins  Company] [varchar](500) NULL,
	[Claim #] [varchar](500) NULL,
	[DOL] [varchar](50) NULL,
	[DOS] [varchar](50) NULL,
	[DOFN] [varchar](50) NULL,
	[Invoice Amount] [varchar](50) NULL,
	[Column 10] [varchar](50) NULL,
	[Case No ] [varchar](500) NULL,
	[Filing Date] [varchar](50) NULL,
	[Attorney] [varchar](500) NULL,
	[County Filed] [varchar](500) NULL,
	[Settled Date] [varchar](50) NULL,
	[Paid Date] [varchar](50) NULL,
	[Paid Amount] [varchar](50) NULL,
	[Notes ] [varchar](500) NULL,
	[Status] [varchar](500) NULL,
	[FirstName] [varchar](100) NULL,
	[LastName] [varchar](100) NULL
) ON [PRIMARY]
GO
