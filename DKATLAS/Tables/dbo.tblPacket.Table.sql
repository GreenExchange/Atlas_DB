USE [DKATLAS]
GO
/****** Object:  Table [dbo].[tblPacket]    Script Date: 6/17/2019 2:53:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPacket](
	[Packet_Auto_ID] [int] IDENTITY(1,1) NOT NULL,
	[PacketID] [varchar](50) NULL,
	[PacketCaption] [varchar](max) NULL,
	[FK_CaseType_Id] [int] NULL,
 CONSTRAINT [PK_tblPacket] PRIMARY KEY CLUSTERED 
(
	[Packet_Auto_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
