USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[keys]    Script Date: 6/17/2019 2:22:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[keys](
	[keyID] [int] IDENTITY(1,1) NOT NULL,
	[docID] [int] NOT NULL,
	[keyData] [char](25) NOT NULL,
	[keyExpires] [datetime] NOT NULL,
	[keySettings] [int] NOT NULL,
	[DomainId] [nvarchar](512) NOT NULL,
 CONSTRAINT [PK_keys] PRIMARY KEY CLUSTERED 
(
	[keyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[keys] ADD  DEFAULT ('h1') FOR [DomainId]
GO
