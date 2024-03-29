USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[tblBasePath]    Script Date: 6/17/2019 2:22:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblBasePath](
	[BasePathId] [int] IDENTITY(1,1) NOT NULL,
	[PhysicalBasePath] [varchar](400) NULL,
	[VirtualBasePath] [varchar](200) NULL,
	[DomainName] [varchar](512) NULL,
	[LawFirmDocDownloadPath] [varchar](512) NULL,
	[LawFirmDoclogicalPath] [varchar](512) NULL,
	[PacketPath] [varchar](512) NULL,
	[PACKET_DOC_URL] [varchar](512) NULL,
	[ArchivedDocumentUploadLocation] [varchar](512) NULL,
	[MergePth] [varchar](512) NULL,
	[BlankMergePth] [varchar](512) NULL,
	[DocumentManagerURL] [varchar](512) NULL,
	[PatientInfoSaveFilePath] [varchar](512) NULL,
	[PatientInfoOpenFilePath] [varchar](512) NULL,
	[EXCEL_SHEET] [varchar](512) NULL,
	[FETCHEXCEL_SHEET] [varchar](512) NULL,
	[TemplateDocsPath] [varchar](512) NULL,
	[BillDownload] [varchar](512) NULL,
	[APIOpenFilePath] [varchar](512) NULL,
	[APISaveFilePath] [varchar](512) NULL,
	[NotesSaveFilePath] [varchar](512) NULL,
	[NotesOpenFilePath] [varchar](512) NULL,
	[BillingDocumentManagerUrl] [varchar](512) NULL,
	[BILLING_FETCHEXCEL_SHEET] [varchar](512) NULL,
	[BasePathType] [int] NULL,
	[ConnectionString] [varchar](512) NULL,
	[PhysicalBaseSubPath] [varchar](400) NULL,
 CONSTRAINT [PK_tblBasePath] PRIMARY KEY CLUSTERED 
(
	[BasePathId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
