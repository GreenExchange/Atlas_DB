USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[TblArbitrator]    Script Date: 6/17/2019 2:22:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblArbitrator](
	[ARBITRATOR_ID] [int] IDENTITY(1,1) NOT NULL,
	[ARBITRATOR_NAME] [varchar](50) NULL,
	[ABITRATOR_LOCATION] [varchar](50) NULL,
	[ARBITRATOR_PHONE] [varchar](20) NULL,
	[ARBITRATOR_FAX] [varchar](20) NULL,
	[IS_AAA] [bit] NULL,
	[ARBITRATOR_Email] [varchar](max) NULL,
	[DomainId] [nvarchar](512) NOT NULL,
	[created_by_user] [nvarchar](255) NOT NULL,
	[created_date] [datetime] NULL,
	[modified_by_user] [nvarchar](255) NULL,
	[modified_date] [datetime] NULL,
	[ARBITRATOR_ID_OLD] [int] NULL,
 CONSTRAINT [PK_TblArbitrator] PRIMARY KEY CLUSTERED 
(
	[ARBITRATOR_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[TblArbitrator] ADD  DEFAULT ('h1') FOR [DomainId]
GO
ALTER TABLE [dbo].[TblArbitrator] ADD  DEFAULT ('admin') FOR [created_by_user]
GO
