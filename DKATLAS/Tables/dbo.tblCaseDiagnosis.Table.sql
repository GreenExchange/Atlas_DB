USE [DKATLAS]
GO
/****** Object:  Table [dbo].[tblCaseDiagnosis]    Script Date: 6/17/2019 2:53:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCaseDiagnosis](
	[CaseDiag_Id] [int] IDENTITY(1,1) NOT NULL,
	[Case_Id] [nvarchar](50) NOT NULL,
	[Diag_Id] [int] NOT NULL,
 CONSTRAINT [PK_tblCaseDiagnosis] PRIMARY KEY CLUSTERED 
(
	[CaseDiag_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
