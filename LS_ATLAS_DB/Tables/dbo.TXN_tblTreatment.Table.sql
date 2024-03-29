USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[TXN_tblTreatment]    Script Date: 6/17/2019 2:22:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TXN_tblTreatment](
	[I_txn_Treatment_Id] [int] IDENTITY(1,1) NOT NULL,
	[Treatment_Id] [int] NOT NULL,
	[DenialReasons_Id] [int] NOT NULL,
	[Action_Type] [nvarchar](100) NULL,
	[DomainId] [nvarchar](512) NOT NULL,
	[DenialReasons_Date] [datetime] NULL,
	[IMEDate] [datetime] NULL,
	[NOTES] [varchar](2000) NULL,
	[Denial_Posted_Date] [datetime] NULL,
 CONSTRAINT [PK_TXN_tblTreatment] PRIMARY KEY CLUSTERED 
(
	[I_txn_Treatment_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TXN_tblTreatment] ADD  DEFAULT ('h1') FOR [DomainId]
GO
ALTER TABLE [dbo].[TXN_tblTreatment] ADD  CONSTRAINT [DF_TXN_tblTreatment_Denial_Posted_Date]  DEFAULT (getdate()) FOR [Denial_Posted_Date]
GO
