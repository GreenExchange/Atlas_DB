USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[tblCasePacket]    Script Date: 6/17/2019 2:22:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCasePacket](
	[CaseId] [nvarchar](50) NOT NULL,
	[Details] [varchar](200) NULL,
	[PacketID] [varchar](50) NOT NULL,
	[FF_POSTED] [bit] NULL,
	[DomainId] [nvarchar](100) NULL
) ON [PRIMARY]
GO
