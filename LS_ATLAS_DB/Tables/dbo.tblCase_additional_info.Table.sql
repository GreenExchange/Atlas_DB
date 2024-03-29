USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[tblCase_additional_info]    Script Date: 6/17/2019 2:22:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCase_additional_info](
	[case_id] [nvarchar](100) NULL,
	[domainid] [nvarchar](50) NULL,
	[Patient_no_Medic] [nvarchar](300) NULL,
	[Purchase_Balance] [nvarchar](300) NULL,
	[Purchase_Price] [nvarchar](100) NULL,
	[First_Party_Case_Status] [nvarchar](300) NULL,
	[First_Party_Attorney] [nvarchar](300) NULL,
	[First_Party_LawFirm] [nvarchar](300) NULL,
	[Our_Attorney] [nvarchar](300) NULL,
	[Law_Suit_Type] [nvarchar](300) NULL,
	[Settledby_First_Party_Litigation] [nvarchar](300) NULL,
	[Attorney_frmBiller_Note] [nvarchar](100) NULL,
	[Our_Attorney_Law_Firm] [nvarchar](100) NULL
) ON [PRIMARY]
GO
