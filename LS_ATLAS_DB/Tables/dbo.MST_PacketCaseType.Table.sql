USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[MST_PacketCaseType]    Script Date: 6/17/2019 2:22:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MST_PacketCaseType](
	[PK_CaseType_Id] [int] IDENTITY(0,1) NOT NULL,
	[CaseType] [nvarchar](500) NOT NULL,
	[DomainId] [varchar](50) NOT NULL,
	[created_by_user] [nvarchar](255) NOT NULL,
	[created_date] [datetime] NULL,
	[modified_by_user] [nvarchar](255) NULL,
	[modified_date] [datetime] NULL,
 CONSTRAINT [PK_PacketCaseType] PRIMARY KEY CLUSTERED 
(
	[DomainId] ASC,
	[CaseType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[MST_PacketCaseType] ADD  DEFAULT ('admin') FOR [created_by_user]
GO
ALTER TABLE [dbo].[MST_PacketCaseType] ADD  CONSTRAINT [DF_PKTCaseStatus_created_date]  DEFAULT (getdate()) FOR [created_date]
GO
