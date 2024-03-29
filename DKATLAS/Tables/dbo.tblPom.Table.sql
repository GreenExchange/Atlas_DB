USE [DKATLAS]
GO
/****** Object:  Table [dbo].[tblPom]    Script Date: 6/17/2019 2:53:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPom](
	[pom_id] [int] IDENTITY(1,1) NOT NULL,
	[pom_date] [datetime] NULL,
	[pom_generated_by] [nvarchar](50) NULL,
	[pom_scan_date] [datetime] NULL,
	[pom_scan_by] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblpom] PRIMARY KEY CLUSTERED 
(
	[pom_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
