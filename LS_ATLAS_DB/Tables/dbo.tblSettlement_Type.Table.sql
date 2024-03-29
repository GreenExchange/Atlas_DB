USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[tblSettlement_Type]    Script Date: 6/17/2019 2:22:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSettlement_Type](
	[SettlementType_Id] [int] IDENTITY(1,1) NOT NULL,
	[Settlement_Type] [varchar](100) NOT NULL,
	[DomainId] [varchar](50) NOT NULL,
	[created_by_user] [nvarchar](255) NOT NULL,
	[created_date] [datetime] NULL,
	[modified_by_user] [nvarchar](255) NULL,
	[modified_date] [datetime] NULL,
	[SettlementType_Id_old] [int] NULL,
 CONSTRAINT [PK_Settlement_Type] PRIMARY KEY CLUSTERED 
(
	[DomainId] ASC,
	[Settlement_Type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblSettlement_Type] ADD  CONSTRAINT [DF__tblSettle__Domai__047AA831]  DEFAULT ('h1') FOR [DomainId]
GO
ALTER TABLE [dbo].[tblSettlement_Type] ADD  DEFAULT ('admin') FOR [created_by_user]
GO
ALTER TABLE [dbo].[tblSettlement_Type] ADD  CONSTRAINT [DF_Settlement_Type_created_date]  DEFAULT (getdate()) FOR [created_date]
GO
