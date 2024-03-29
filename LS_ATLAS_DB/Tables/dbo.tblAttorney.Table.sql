USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[tblAttorney]    Script Date: 6/17/2019 2:22:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAttorney](
	[Attorney_AutoId] [int] IDENTITY(1,1) NOT NULL,
	[Attorney_Id] [varchar](40) NOT NULL,
	[Attorney_LastName] [varchar](100) NULL,
	[Attorney_FirstName] [varchar](100) NULL,
	[Attorney_Address] [varchar](255) NULL,
	[Attorney_City] [varchar](50) NULL,
	[Attorney_State] [varchar](50) NULL,
	[Attorney_Zip] [varchar](50) NULL,
	[Attorney_Phone] [varchar](20) NULL,
	[Attorney_Fax] [varchar](20) NULL,
	[Attorney_Email] [varchar](40) NULL,
	[Defendant_Id] [nvarchar](50) NOT NULL,
	[DomainId] [nvarchar](512) NOT NULL,
	[created_by_user] [nvarchar](255) NOT NULL,
	[created_date] [datetime] NULL,
	[modified_by_user] [nvarchar](255) NULL,
	[modified_date] [datetime] NULL,
 CONSTRAINT [PK_tblAttorney] PRIMARY KEY CLUSTERED 
(
	[Attorney_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblAttorney] ADD  DEFAULT ('h1') FOR [DomainId]
GO
ALTER TABLE [dbo].[tblAttorney] ADD  DEFAULT ('admin') FOR [created_by_user]
GO
