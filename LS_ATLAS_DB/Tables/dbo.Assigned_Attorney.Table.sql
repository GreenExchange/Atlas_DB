USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[Assigned_Attorney]    Script Date: 6/17/2019 2:22:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Assigned_Attorney](
	[PK_Assigned_Attorney_ID] [int] IDENTITY(1,1) NOT NULL,
	[Assigned_Attorney] [varchar](200) NOT NULL,
	[DomainID] [varchar](50) NOT NULL,
	[created_by_user] [nvarchar](255) NOT NULL,
	[created_date] [datetime] NULL,
	[modified_by_user] [nvarchar](255) NULL,
	[modified_date] [datetime] NULL,
	[LawFirm_Name] [varchar](200) NULL,
	[Assigned_Attorney_Address] [nvarchar](200) NULL,
	[Assigned_Attorney_Phone] [nvarchar](50) NULL,
	[Assigned_Attorney_Fax] [nvarchar](50) NULL,
	[Assigned_Attorney_Email] [nvarchar](200) NULL,
 CONSTRAINT [PK_Assigned_Attorney] PRIMARY KEY CLUSTERED 
(
	[Assigned_Attorney] ASC,
	[DomainID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Assigned_Attorney] ADD  CONSTRAINT [DF_Assigned_Attorney_created_date]  DEFAULT (getdate()) FOR [created_date]
GO
