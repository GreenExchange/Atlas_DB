USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[XN_TEMP_McCollum]    Script Date: 6/17/2019 2:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[XN_TEMP_McCollum](
	[Provider] [nvarchar](255) NULL,
	[Patient ID] [nvarchar](255) NULL,
	[PatientLastName] [nvarchar](255) NULL,
	[PatientFirstName] [nvarchar](255) NULL,
	[PatientDOB] [datetime] NULL,
	[CaseTypeName] [nvarchar](255) NULL,
	[InsuranceName] [nvarchar](255) NULL,
	[DateofAccident] [datetime] NULL,
	[Claim Number] [nvarchar](255) NULL,
	[PolicyNumber] [nvarchar](255) NULL,
	[BillType] [nvarchar](255) NULL,
	[TreatingProvider] [nvarchar](255) NULL,
	[FirstVisitDate] [datetime] NULL,
	[LastVisitDate] [datetime] NULL,
	[BillDate] [datetime] NULL,
	[FltBillAmount] [money] NULL,
	[FltPaid] [money] NULL,
	[FltBalance] [money] NULL,
	[InitialStatus] [nvarchar](255) NULL,
	[Notes] [nvarchar](255) NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DomainId] [varchar](500) NULL,
	[AtlasProviderId] [int] NULL,
	[IsDuplicateCase] [int] NULL,
	[AtlasInsuranceId] [int] NULL,
	[GBB_Type] [varchar](10) NULL,
	[Transferd_Date] [date] NULL,
	[Transferd_Status] [varchar](100) NULL
) ON [PRIMARY]
GO
