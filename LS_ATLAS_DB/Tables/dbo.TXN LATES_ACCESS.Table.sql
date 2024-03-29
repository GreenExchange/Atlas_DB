USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[TXN LATES_ACCESS]    Script Date: 6/17/2019 2:22:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TXN LATES_ACCESS](
	[ACCESS_ID] [int] IDENTITY(1,1) NOT NULL,
	[TEMPLATE_ID] [int] NOT NULL,
	[USER_TYPE] [varchar](100) NOT NULL,
 CONSTRAINT [PK_TXN LATES_ACCESS] PRIMARY KEY CLUSTERED 
(
	[ACCESS_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
