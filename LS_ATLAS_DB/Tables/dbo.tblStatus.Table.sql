USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[tblStatus]    Script Date: 6/17/2019 2:22:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblStatus](
	[Status_Id] [int] IDENTITY(1,1) NOT NULL,
	[Status_Type] [nvarchar](50) NOT NULL,
	[Status_Abr] [nvarchar](50) NULL,
	[Status_Hierarchy] [int] NULL,
	[Auto_bill_amount] [money] NULL,
	[Auto_bill_type] [nvarchar](20) NULL,
	[Auto_bill_notes] [varchar](200) NULL,
	[Status_Description] [nvarchar](2000) NULL,
	[Final_Status] [nvarchar](200) NULL,
	[IsActive] [nvarchar](10) NULL,
	[forum] [nvarchar](50) NULL,
	[Filed_Unfiled] [nvarchar](50) NULL,
	[hierarchy_Id] [int] NULL,
	[DomainId] [varchar](50) NOT NULL,
	[status_age_limit] [varchar](20) NULL,
	[created_by_user] [varchar](255) NOT NULL,
	[created_date] [datetime] NULL,
	[modified_by_user] [varchar](255) NULL,
	[modified_date] [datetime] NULL,
 CONSTRAINT [PK_Status_Type] PRIMARY KEY CLUSTERED 
(
	[DomainId] ASC,
	[Status_Type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblStatus] ADD  CONSTRAINT [DF_tblStatus_Status_Hierarchy]  DEFAULT ((0)) FOR [Status_Hierarchy]
GO
ALTER TABLE [dbo].[tblStatus] ADD  CONSTRAINT [DF__tblStatus__Domai__084B3915]  DEFAULT ('h1') FOR [DomainId]
GO
ALTER TABLE [dbo].[tblStatus] ADD  CONSTRAINT [DF__tblStatus__creat__0FAD2F12]  DEFAULT ('admin') FOR [created_by_user]
GO
ALTER TABLE [dbo].[tblStatus] ADD  CONSTRAINT [DF_Status_Type_created_date]  DEFAULT (getdate()) FOR [created_date]
GO
