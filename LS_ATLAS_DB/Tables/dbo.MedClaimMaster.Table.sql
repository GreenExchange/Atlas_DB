USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[MedClaimMaster]    Script Date: 6/17/2019 2:22:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedClaimMaster](
	[Patient First Name] [varchar](500) NULL,
	[Patient Last Name] [varchar](500) NULL,
	[Prim Insurance] [varchar](500) NULL,
	[CPT] [varchar](50) NULL,
	[Prim Policy ] [varchar](500) NULL,
	[DOS] [varchar](50) NULL,
	[Project Code] [varchar](50) NULL,
	[Medical Provider] [varchar](500) NULL,
	[ProviderID] [varchar](50) NULL,
	[Bill number] [varchar](50) NULL,
	[Patient number Medic] [varchar](50) NULL,
	[Accident Date] [varchar](50) NULL,
	[ Purchase Balance ] [varchar](50) NULL,
	[ Purchase Price ] [varchar](50) NULL,
	[Date of Purchase] [varchar](50) NULL,
	[Note] [varchar](50) NULL,
	[Case Number] [varchar](500) NULL,
	[Our Attorney] [varchar](500) NULL
) ON [PRIMARY]
GO
