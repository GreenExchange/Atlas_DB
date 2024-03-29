USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[XN_AMT_CASE_CPT_DATA]    Script Date: 6/17/2019 2:22:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[XN_AMT_CASE_CPT_DATA](
	[ACCOUNT NUMBER_x] [float] NULL,
	[LAST NAME] [nvarchar](255) NULL,
	[FIRST NAME] [nvarchar](255) NULL,
	[DOS_x] [datetime] NULL,
	[INSURANCE_x] [nvarchar](255) NULL,
	[COMMENT] [nvarchar](255) NULL,
	[CPT CODE] [float] NULL,
	[Amount] [float] NULL,
	[LIT or not] [nvarchar](255) NULL,
	[F10] [nvarchar](255) NULL,
	[F11] [nvarchar](255) NULL,
	[F12] [nvarchar](255) NULL,
	[F13] [nvarchar](255) NULL,
	[F14] [nvarchar](255) NULL,
	[AutoID] [int] IDENTITY(1,1) NOT NULL,
	[Status_Done] [varchar](100) NULL
) ON [PRIMARY]
GO
