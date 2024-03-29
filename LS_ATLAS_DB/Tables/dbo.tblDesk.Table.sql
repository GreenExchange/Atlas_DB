USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[tblDesk]    Script Date: 6/17/2019 2:22:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDesk](
	[Desk_Id] [int] IDENTITY(1,1) NOT NULL,
	[Desk_Name] [varchar](200) NULL,
	[DomainId] [nvarchar](512) NOT NULL,
 CONSTRAINT [PK_tblDesk] PRIMARY KEY CLUSTERED 
(
	[Desk_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblDesk] ADD  DEFAULT ('h1') FOR [DomainId]
GO
