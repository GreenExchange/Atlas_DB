USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[tblDiagnosis]    Script Date: 6/17/2019 2:22:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDiagnosis](
	[Diag_Id] [int] IDENTITY(1,1) NOT NULL,
	[Diag_Code] [nvarchar](50) NOT NULL,
	[Diag_Name] [nvarchar](300) NULL,
	[DomainId] [nvarchar](512) NOT NULL,
 CONSTRAINT [PK_tblDiagnosis] PRIMARY KEY CLUSTERED 
(
	[Diag_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblDiagnosis] ADD  DEFAULT ('h1') FOR [DomainId]
GO
