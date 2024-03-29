USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[tblrecon_file]    Script Date: 6/17/2019 2:22:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblrecon_file](
	[Auto_Id] [int] IDENTITY(1,1) NOT NULL,
	[FACS_ACCT] [nvarchar](50) NULL,
	[Injuredparty_lastName] [nvarchar](100) NULL,
	[Injuredparty_FirstName] [nvarchar](100) NULL,
	[Product_Line] [nvarchar](50) NULL,
	[Exp] [nvarchar](50) NULL,
	[DU13211] [nvarchar](50) NULL,
	[DU13212] [nvarchar](50) NULL,
	[DU13213] [nvarchar](50) NULL,
	[File_Rec_Date] [nvarchar](50) NULL,
	[ACCT#_From_clt] [nvarchar](50) NULL,
	[Doctor_Name] [nvarchar](100) NULL,
	[Client_Name] [nvarchar](100) NULL,
	[DOS] [nvarchar](50) NULL,
	[Insurance_Id] [nvarchar](50) NULL,
	[DomainId] [nvarchar](512) NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblrecon_file] ADD  DEFAULT ('h1') FOR [DomainId]
GO
