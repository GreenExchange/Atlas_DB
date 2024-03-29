USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[tblInvoicePayment_Documents]    Script Date: 6/17/2019 2:22:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblInvoicePayment_Documents](
	[IDocID] [int] IDENTITY(1,1) NOT NULL,
	[InvPay_Doc_Name] [nvarchar](100) NULL,
	[InvPay_File_Path] [nvarchar](200) NULL,
	[Provider_Id] [int] NULL,
	[Payment_Id] [int] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[DomainId] [nvarchar](50) NULL,
	[DocType] [nvarchar](100) NULL,
	[BasePathId] [int] NULL,
 CONSTRAINT [PK_tblInvoicePayment_Documents] PRIMARY KEY CLUSTERED 
(
	[IDocID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
