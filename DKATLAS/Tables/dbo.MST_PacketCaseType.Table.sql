USE [DKATLAS]
GO
/****** Object:  Table [dbo].[MST_PacketCaseType]    Script Date: 6/17/2019 2:53:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MST_PacketCaseType](
	[PK_CaseType_Id] [int] IDENTITY(0,1) NOT NULL,
	[CaseType] [nvarchar](500) NULL,
	[created_by_user] [nvarchar](255) NOT NULL,
	[created_date] [datetime] NULL,
	[modified_by_user] [nvarchar](255) NULL,
	[modified_date] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[PK_CaseType_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[MST_PacketCaseType] ADD  DEFAULT ('admin') FOR [created_by_user]
GO
