USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[TXN_EXHIBIT_SEQUENCE_FOR_ARBITRATION]    Script Date: 6/17/2019 2:22:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TXN_EXHIBIT_SEQUENCE_FOR_ARBITRATION](
	[I_SEQUENCE] [int] NULL,
	[I_DOCUMENT_TYPE] [int] NULL,
	[DOCUMENT_TYPE] [nvarchar](200) NULL,
	[DomainId] [nvarchar](512) NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TXN_EXHIBIT_SEQUENCE_FOR_ARBITRATION] ADD  DEFAULT ('h1') FOR [DomainId]
GO
