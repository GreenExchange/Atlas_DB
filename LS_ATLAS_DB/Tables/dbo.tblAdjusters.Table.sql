USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[tblAdjusters]    Script Date: 6/17/2019 2:22:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAdjusters](
	[Adjuster_Id] [int] IDENTITY(1,1) NOT NULL,
	[Adjuster_LastName] [nvarchar](100) NULL,
	[Adjuster_FirstName] [nvarchar](100) NULL,
	[InsuranceCompany_Id] [nvarchar](50) NULL,
	[Adjuster_Phone] [nvarchar](50) NULL,
	[Adjuster_Fax] [nvarchar](50) NULL,
	[Adjuster_Email] [nvarchar](50) NULL,
	[Adjuster_Extension] [nvarchar](50) NULL,
	[Adjuster_Address] [nvarchar](250) NULL,
	[DomainId] [nvarchar](512) NOT NULL,
	[created_by_user] [nvarchar](255) NOT NULL,
	[created_date] [datetime] NULL,
	[modified_by_user] [nvarchar](255) NULL,
	[modified_date] [datetime] NULL,
	[adjuster_id_old] [int] NULL,
 CONSTRAINT [PK_tblAdjusters] PRIMARY KEY CLUSTERED 
(
	[Adjuster_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblAdjusters] ADD  CONSTRAINT [DF__tblAdjust__Domai__22401542]  DEFAULT ('h1') FOR [DomainId]
GO
ALTER TABLE [dbo].[tblAdjusters] ADD  CONSTRAINT [DF__tblAdjust__creat__62A57E71]  DEFAULT ('admin') FOR [created_by_user]
GO
