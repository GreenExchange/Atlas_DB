USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[tblOperatingDoctor]    Script Date: 6/17/2019 2:22:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOperatingDoctor](
	[Doctor_Id] [int] IDENTITY(1,1) NOT NULL,
	[Doctor_Name] [nvarchar](500) NULL,
	[Active] [bit] NULL,
	[DomainId] [nvarchar](512) NOT NULL,
	[created_by_user] [nvarchar](255) NOT NULL,
	[created_date] [datetime] NULL,
	[modified_by_user] [nvarchar](255) NULL,
	[modified_date] [datetime] NULL,
	[Doctor_Id_OLD] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblOperatingDoctor] ADD  CONSTRAINT [DF_tblOperatingDoctor_Active]  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[tblOperatingDoctor] ADD  DEFAULT ('h1') FOR [DomainId]
GO
ALTER TABLE [dbo].[tblOperatingDoctor] ADD  DEFAULT ('admin') FOR [created_by_user]
GO
