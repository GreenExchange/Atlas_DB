USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[XN_Temp_Payment_Posting]    Script Date: 6/17/2019 2:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[XN_Temp_Payment_Posting](
	[AutoID] [int] IDENTITY(1,1) NOT NULL,
	[Account] [nvarchar](255) NULL,
	[BillNumber] [nvarchar](255) NULL,
	[PatientName] [nvarchar](255) NULL,
	[InsuranceName] [nvarchar](255) NULL,
	[DoctorName] [nvarchar](255) NULL,
	[ProviderName] [nvarchar](255) NULL,
	[Location] [nvarchar](255) NULL,
	[Specialty] [nvarchar](255) NULL,
	[CheckNo] [float] NULL,
	[CheckDate] [datetime] NULL,
	[CheckAmount] [float] NULL,
	[PaymentDate] [datetime] NULL,
	[Username] [nvarchar](255) NULL,
	[PaymentType] [nvarchar](255) NULL,
	[Transfer_Status] [varchar](200) NULL
) ON [PRIMARY]
GO
