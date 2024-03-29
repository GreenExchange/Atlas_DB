USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[tblAttorney_Master]    Script Date: 6/17/2019 2:22:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAttorney_Master](
	[Attorney_Id] [int] IDENTITY(1,1) NOT NULL,
	[Attorney_Type_Id] [nvarchar](50) NOT NULL,
	[Attorney_LastName] [varchar](100) NULL,
	[Attorney_FirstName] [varchar](100) NULL,
	[Attorney_Address] [varchar](255) NULL,
	[Attorney_City] [varchar](50) NULL,
	[Attorney_State] [varchar](50) NULL,
	[Attorney_Zip] [varchar](50) NULL,
	[Attorney_Phone] [varchar](20) NULL,
	[Attorney_Fax] [varchar](20) NULL,
	[Attorney_Email] [varchar](40) NULL,
	[DomainId] [nvarchar](512) NOT NULL,
	[created_by_user] [nvarchar](255) NOT NULL,
	[created_date] [datetime] NULL,
	[modified_by_user] [nvarchar](255) NULL,
	[modified_date] [datetime] NULL,
	[LawFirmName] [varchar](200) NULL,
	[IsOutsideAttorney] [bit] NULL,
	[Attorney_BAR_Number] [varchar](150) NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblAttorney_Master] ADD  DEFAULT ((0)) FOR [IsOutsideAttorney]
GO
