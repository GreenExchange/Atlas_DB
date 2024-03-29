USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[tblMenu_Domain_Access]    Script Date: 6/17/2019 2:22:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMenu_Domain_Access](
	[MenuAccessId] [int] IDENTITY(1,1) NOT NULL,
	[MenuId] [int] NOT NULL,
	[DomainId] [varchar](50) NOT NULL,
 CONSTRAINT [IX_Menu_Domain_Access] UNIQUE NONCLUSTERED 
(
	[DomainId] ASC,
	[MenuId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
