USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[XN_TEMP_AMT_4]    Script Date: 6/17/2019 2:22:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[XN_TEMP_AMT_4](
	[PatientLastName] [nvarchar](255) NULL,
	[PatientFirstName] [nvarchar](255) NULL,
	[PatientName] [nvarchar](255) NULL,
	[InsuranceName] [nvarchar](255) NULL,
	[ClaimNumber] [float] NULL,
	[FltBillAmount] [float] NULL,
	[FltPaid] [float] NULL,
	[PDF Ledger Balance] [float] NULL,
	[Last Date of Funding] [float] NULL,
	[From Excel spreadsheet] [float] NULL,
	[First DOS of funding] [datetime] NULL,
	[Last DOS] [datetime] NULL,
	[DateofAccident] [datetime] NULL,
	[FirstVisitDate] [datetime] NULL,
	[LastVisitDate] [nvarchar](255) NULL,
	[Percentage collected ] [float] NULL,
	[IndexNumber] [nvarchar](255) NULL,
	[Provider Attorney] [nvarchar](255) NULL,
	[Provider Attorney Phone] [nvarchar](255) NULL,
	[Albert's Comment] [nvarchar](255) NULL,
	[Jason's Comment] [nvarchar](255) NULL,
	[1211 Revan's email] [nvarchar](255) NULL,
	[Number of CPT procedure] [float] NULL,
	[AtlasInsuranceId] [int] NULL,
	[AtlasProviderId] [int] NULL,
	[DomainID] [varchar](50) NULL,
	[Transferd_Date] [date] NULL,
	[Transferd_Status] [varchar](50) NULL,
	[AUTOID] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]
GO
