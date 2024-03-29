USE [DKATLAS]
GO
/****** Object:  Table [dbo].[TXN_tblTreatment]    Script Date: 6/17/2019 2:53:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TXN_tblTreatment](
	[I_txn_Treatment_Id] [int] IDENTITY(1,1) NOT NULL,
	[Treatment_Id] [int] NOT NULL,
	[DenialReasons_Id] [int] NOT NULL,
	[Action_Type] [nvarchar](100) NULL,
 CONSTRAINT [PK_TXN_tblTreatment] PRIMARY KEY CLUSTERED 
(
	[I_txn_Treatment_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
