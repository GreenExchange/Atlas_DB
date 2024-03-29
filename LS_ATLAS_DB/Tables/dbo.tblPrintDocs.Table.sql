USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[tblPrintDocs]    Script Date: 6/17/2019 2:22:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPrintDocs](
	[Print_Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Case_id] [varchar](50) NULL,
	[Doc_Id] [int] NULL,
	[Requested_On] [datetime] NULL,
	[Requested_By] [int] NULL,
	[Printed_On] [datetime] NULL,
	[DomainId] [nvarchar](512) NOT NULL,
 CONSTRAINT [PK_tblPrintDocs] PRIMARY KEY CLUSTERED 
(
	[Print_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblPrintDocs] ADD  DEFAULT ('h1') FOR [DomainId]
GO
