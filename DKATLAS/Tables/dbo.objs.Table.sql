USE [DKATLAS]
GO
/****** Object:  Table [dbo].[objs]    Script Date: 6/17/2019 2:53:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[objs](
	[objID] [int] IDENTITY(1,1) NOT NULL,
	[docID] [int] NOT NULL,
	[objType] [int] NOT NULL,
	[objSettings] [int] NOT NULL,
	[objData] [image] NOT NULL,
	[objDataLength] [int] NOT NULL,
 CONSTRAINT [PK_objs] PRIMARY KEY CLUSTERED 
(
	[objID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
