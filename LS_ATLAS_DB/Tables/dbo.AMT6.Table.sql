USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[AMT6]    Script Date: 6/17/2019 2:22:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AMT6](
	[ID] [nvarchar](255) NULL,
	[AUTOID] [nvarchar](255) NULL,
	[Patient Last Name] [nvarchar](255) NULL,
	[Patient First Name] [nvarchar](255) NULL,
	[Total Billed Amount] [float] NULL,
	[FltPaid] [nvarchar](255) NULL,
	[DOS] [datetime] NULL,
	[LastVisitDate] [datetime] NULL,
	[DateofAccident] [nvarchar](255) NULL,
	[DomainId] [nvarchar](255) NULL,
	[AtlasProviderId] [nvarchar](255) NULL,
	[AtlasInsuranceId] [nvarchar](255) NULL,
	[Transferd_Status] [nvarchar](50) NULL
) ON [PRIMARY]
GO
