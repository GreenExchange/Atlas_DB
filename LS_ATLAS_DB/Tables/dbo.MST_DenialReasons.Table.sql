USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[MST_DenialReasons]    Script Date: 6/17/2019 2:22:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MST_DenialReasons](
	[PK_Denial_ID] [int] IDENTITY(1,1) NOT NULL,
	[DenialReason] [nvarchar](200) NULL,
	[DomainId] [nvarchar](512) NOT NULL,
	[created_by_user] [nvarchar](255) NOT NULL,
	[created_date] [datetime] NULL,
	[modified_by_user] [nvarchar](255) NULL,
	[modified_date] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[PK_Denial_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[MST_DenialReasons] ADD  DEFAULT ('h1') FOR [DomainId]
GO
ALTER TABLE [dbo].[MST_DenialReasons] ADD  DEFAULT ('admin') FOR [created_by_user]
GO
