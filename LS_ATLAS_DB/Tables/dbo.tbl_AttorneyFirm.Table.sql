USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[tbl_AttorneyFirm]    Script Date: 6/17/2019 2:22:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_AttorneyFirm](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[LocationId] [int] NULL,
	[Type_Of_Practice] [varchar](50) NULL,
	[Created_Date] [date] NULL,
	[DomainId] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
