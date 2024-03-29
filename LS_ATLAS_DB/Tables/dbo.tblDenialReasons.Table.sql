USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[tblDenialReasons]    Script Date: 6/17/2019 2:22:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDenialReasons](
	[DenialReasons_Id] [int] IDENTITY(1,1) NOT NULL,
	[DenialReasons_Type] [nvarchar](100) NULL,
	[Denial_Colorcode] [nvarchar](100) NULL,
	[I_CATEGORY_ID] [int] NULL,
	[DomainId] [nvarchar](50) NULL,
	[created_by_user] [nvarchar](255) NOT NULL,
	[created_date] [datetime] NULL,
	[modified_by_user] [nvarchar](255) NULL,
	[modified_date] [datetime] NULL,
	[DenialReasons_Id_Old] [int] NULL,
 CONSTRAINT [PK_tblDenialReasons] PRIMARY KEY CLUSTERED 
(
	[DenialReasons_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblDenialReasons] ADD  CONSTRAINT [tblDenialReasons_DomainId]  DEFAULT ('h1') FOR [DomainId]
GO
ALTER TABLE [dbo].[tblDenialReasons] ADD  DEFAULT ('admin') FOR [created_by_user]
GO
