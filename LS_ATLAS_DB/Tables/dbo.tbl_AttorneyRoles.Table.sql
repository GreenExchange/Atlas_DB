USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[tbl_AttorneyRoles]    Script Date: 6/17/2019 2:22:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_AttorneyRoles](
	[Id] [tinyint] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NOT NULL,
	[DomainId] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
