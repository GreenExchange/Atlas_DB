USE [DKATLAS]
GO
/****** Object:  Table [dbo].[tblDocumentType]    Script Date: 6/17/2019 2:53:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDocumentType](
	[Document_ID] [int] IDENTITY(1,1) NOT NULL,
	[Document_Type] [nvarchar](255) NOT NULL,
	[doc_for] [int] NULL,
	[Doc_Sequence] [int] NULL,
	[Initial_docs] [bit] NOT NULL,
 CONSTRAINT [PK_tblDocumentType] PRIMARY KEY CLUSTERED 
(
	[Document_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblDocumentType] ADD  CONSTRAINT [DF_tblDocumentType_doc_for]  DEFAULT ((0)) FOR [doc_for]
GO
ALTER TABLE [dbo].[tblDocumentType] ADD  CONSTRAINT [DF_tblDocumentType_Provider_docs]  DEFAULT ((0)) FOR [Initial_docs]
GO
