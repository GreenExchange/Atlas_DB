USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[Tbl_Rules]    Script Date: 6/17/2019 2:22:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Rules](
	[Rules_ID] [int] IDENTITY(1,1) NOT NULL,
	[Rules_Disc] [nvarchar](max) NULL,
	[Provider_ID] [int] NULL,
	[InsuranceCompanyID] [int] NULL,
	[Provider_Group] [nvarchar](250) NULL,
	[Insurance_Group] [nvarchar](250) NULL,
	[Status] [varchar](50) NULL,
	[Date_Created] [date] NOT NULL,
	[Created_By] [varchar](50) NULL,
	[Rule_RequestedBy] [nvarchar](250) NULL,
	[Rule_Component] [nvarchar](max) NULL,
	[Rule_Action] [nvarchar](max) NULL,
	[Rule_Type] [nvarchar](max) NULL,
	[DomainId] [nvarchar](50) NULL,
	[FilePath] [nvarchar](1000) NULL,
	[Filename] [nvarchar](250) NULL,
	[Category] [nvarchar](50) NULL,
 CONSTRAINT [PK_Rules] PRIMARY KEY CLUSTERED 
(
	[Rules_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Tbl_Rules] ADD  CONSTRAINT [DF_Tbl_Rules_Date_Created]  DEFAULT (getdate()) FOR [Date_Created]
GO
ALTER TABLE [dbo].[Tbl_Rules] ADD  CONSTRAINT [DF_Tbl_Rules_DomainId]  DEFAULT ('h1') FOR [DomainId]
GO
