USE [DKATLAS]
GO
/****** Object:  UserDefinedTableType [dbo].[LawFirmDetails]    Script Date: 6/17/2019 2:53:52 AM ******/
CREATE TYPE [dbo].[LawFirmDetails] AS TABLE(
	[LawFirmId] [varchar](100) NULL,
	[AccountDomain] [varchar](100) NULL
)
GO
