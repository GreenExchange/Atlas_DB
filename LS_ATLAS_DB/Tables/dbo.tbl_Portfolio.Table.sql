USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[tbl_Portfolio]    Script Date: 6/17/2019 2:22:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Portfolio](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Description] [varchar](250) NULL,
	[Reserved_Percentage] [int] NULL,
	[Created_Date] [date] NOT NULL,
	[ProgramId] [int] NULL,
	[DomainId] [nvarchar](50) NOT NULL,
	[Portfolio_Type] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tbl_Portfolio] ADD  DEFAULT (getdate()) FOR [Created_Date]
GO
ALTER TABLE [dbo].[tbl_Portfolio] ADD  DEFAULT ((1)) FOR [Portfolio_Type]
GO
