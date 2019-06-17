USE [DKATLAS]
GO
/****** Object:  Table [dbo].[tblprocessserver]    Script Date: 6/17/2019 2:53:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblprocessserver](
	[psid] [int] IDENTITY(1,1) NOT NULL,
	[psfirstname] [varchar](100) NULL,
	[pslastname] [varchar](100) NULL,
	[pslicense] [varchar](100) NULL,
	[Active] [bit] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblprocessserver] ADD  CONSTRAINT [DF_tblprocessserver_Active]  DEFAULT ((1)) FOR [Active]
GO
