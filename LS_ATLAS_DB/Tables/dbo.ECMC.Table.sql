USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[ECMC]    Script Date: 6/17/2019 2:22:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ECMC](
	[Patient Name] [nvarchar](255) NULL,
	[Account] [nvarchar](255) NULL,
	[UCR] [nvarchar](255) NULL,
	[Account Type] [nvarchar](255) NULL,
	[ST] [nvarchar](255) NULL,
	[Discharge Date] [nvarchar](255) NULL,
	[Age Date] [nvarchar](255) NULL,
	[Age in Days] [float] NULL,
	[Insurance Group] [nvarchar](255) NULL,
	[Policy] [nvarchar](255) NULL,
	[Insurance] [nvarchar](255) NULL,
	[Insurance Name] [nvarchar](255) NULL,
	[No] [nvarchar](255) NULL,
	[Bill_No] [nvarchar](255) NULL,
	[Bill Charges] [money] NULL,
	[Bill Balance] [money] NULL,
	[MCD Insurance Payments] [money] NULL,
	[Other Insurance Payments] [money] NULL,
	[SP Payments] [money] NULL,
	[Bill Receipt] [money] NULL,
	[Bill Adjustment] [money] NULL,
	[Bill Expected Reimbursement] [money] NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FHKP_Case_Id] [nvarchar](50) NULL,
	[DomainId] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ECMC] ADD  DEFAULT ('h1') FOR [DomainId]
GO
