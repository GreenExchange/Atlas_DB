USE [LS_ATLAS_DB]
GO
/****** Object:  UserDefinedTableType [dbo].[UDT_CaseNumber]    Script Date: 6/17/2019 2:31:14 AM ******/
CREATE TYPE [dbo].[UDT_CaseNumber] AS TABLE(
	[Id] [int] NOT NULL,
	[Case_Id] [nvarchar](50) NULL,
	[Case_Number] [varchar](40) NULL
)
GO
