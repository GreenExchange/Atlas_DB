USE [LS_ATLAS_DB]
GO
/****** Object:  UserDefinedTableType [dbo].[BillDetails]    Script Date: 6/17/2019 2:31:12 AM ******/
CREATE TYPE [dbo].[BillDetails] AS TABLE(
	[CaseId] [varchar](100) NULL,
	[CaseNo] [int] NULL,
	[CompanyId] [varchar](100) NULL,
	[BillNumber] [varchar](100) NULL,
	[LawFirmId] [varchar](100) NULL,
	[DomainId] [varchar](100) NULL
)
GO
