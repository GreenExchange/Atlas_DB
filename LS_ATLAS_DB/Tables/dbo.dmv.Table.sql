USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[dmv]    Script Date: 6/17/2019 2:22:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dmv](
	[ID] [nvarchar](255) NULL,
	[Insurer_Name] [nvarchar](255) NULL,
	[Insurer_Suit_Name] [nvarchar](255) NULL,
	[Insurer_Perm_Address] [nvarchar](255) NULL,
	[Insurer_Perm_City] [nvarchar](255) NULL,
	[Insurer_Perm_State] [nvarchar](255) NULL,
	[Insurer_Perm_Zip] [nvarchar](255) NULL,
	[Insurer_Perm_Phone] [nvarchar](255) NULL,
	[Insurer_Perm_Fax] [nvarchar](255) NULL,
	[Insurer_local_Address] [nvarchar](255) NULL,
	[Insurer_local_City] [nvarchar](255) NULL,
	[Insurer_local_State] [nvarchar](255) NULL,
	[Insurer_local_Zip] [nvarchar](255) NULL,
	[Insurer_local_phone] [nvarchar](255) NULL,
	[Insurer_local_fax] [nvarchar](255) NULL,
	[DomainId] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[dmv] ADD  DEFAULT ('h1') FOR [DomainId]
GO
