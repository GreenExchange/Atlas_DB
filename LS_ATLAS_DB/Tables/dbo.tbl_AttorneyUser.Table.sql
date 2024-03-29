USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[tbl_AttorneyUser]    Script Date: 6/17/2019 2:22:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_AttorneyUser](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Email] [varchar](250) NOT NULL,
	[Role] [varchar](255) NOT NULL,
	[AttorneyFirmId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[Address] [varchar](250) NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](50) NULL,
	[Country] [varchar](50) NULL,
	[Zip] [int] NOT NULL,
	[Created_Date] [date] NOT NULL,
	[DomainId] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tbl_AttorneyUser] ADD  DEFAULT (getdate()) FOR [Created_Date]
GO
