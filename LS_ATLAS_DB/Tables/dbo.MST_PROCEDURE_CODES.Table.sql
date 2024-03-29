USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[MST_PROCEDURE_CODES]    Script Date: 6/17/2019 2:22:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MST_PROCEDURE_CODES](
	[Code] [float] NULL,
	[Description] [nvarchar](255) NULL,
	[Amount] [float] NULL,
	[Specialty] [nvarchar](255) NULL,
	[ins_fee_schedule] [money] NULL,
	[Auto_Proc_id] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]
GO
