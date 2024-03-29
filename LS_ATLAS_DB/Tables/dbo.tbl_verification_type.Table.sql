USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[tbl_verification_type]    Script Date: 6/17/2019 2:22:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_verification_type](
	[vr_type_Id] [int] IDENTITY(1,1) NOT NULL,
	[verification_type] [varchar](150) NULL,
 CONSTRAINT [PK_tbl_verification_type] PRIMARY KEY CLUSTERED 
(
	[vr_type_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
