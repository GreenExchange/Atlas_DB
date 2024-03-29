USE [DKATLAS]
GO
/****** Object:  Table [dbo].[tblAdjusters]    Script Date: 6/17/2019 2:53:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAdjusters](
	[Adjuster_Id] [int] IDENTITY(1,1) NOT NULL,
	[Adjuster_LastName] [nvarchar](100) NULL,
	[Adjuster_FirstName] [nvarchar](100) NULL,
	[InsuranceCompany_Id] [nvarchar](50) NOT NULL,
	[Adjuster_Phone] [nvarchar](50) NULL,
	[Adjuster_Fax] [nvarchar](50) NULL,
	[Adjuster_Email] [nvarchar](50) NULL,
	[Adjuster_Extension] [nvarchar](50) NULL,
	[Adjuster_Address] [nvarchar](250) NULL,
	[created_by_user] [nvarchar](255) NOT NULL,
	[created_date] [datetime] NULL,
	[modified_by_user] [nvarchar](255) NULL,
	[modified_date] [datetime] NULL,
 CONSTRAINT [PK_tblAdjusters] PRIMARY KEY CLUSTERED 
(
	[Adjuster_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblAdjusters] ADD  DEFAULT ('admin') FOR [created_by_user]
GO
