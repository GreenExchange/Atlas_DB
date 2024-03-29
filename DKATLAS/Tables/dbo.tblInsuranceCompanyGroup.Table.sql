USE [DKATLAS]
GO
/****** Object:  Table [dbo].[tblInsuranceCompanyGroup]    Script Date: 6/17/2019 2:53:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblInsuranceCompanyGroup](
	[InsuranceCompanyGroup_ID] [int] IDENTITY(1,1) NOT NULL,
	[InsuranceCompanyGroup_Name] [varchar](255) NOT NULL,
	[DomainId] [nvarchar](100) NOT NULL,
	[created_by_user] [nvarchar](255) NOT NULL,
	[created_date] [datetime] NULL,
	[modified_by_user] [nvarchar](255) NULL,
	[modified_date] [datetime] NULL,
 CONSTRAINT [PK_InsuranceCompanyGroup] PRIMARY KEY CLUSTERED 
(
	[DomainId] ASC,
	[InsuranceCompanyGroup_Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
