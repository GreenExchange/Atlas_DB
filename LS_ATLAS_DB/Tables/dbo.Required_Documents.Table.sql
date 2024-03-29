USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[Required_Documents]    Script Date: 6/17/2019 2:22:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Required_Documents](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DomainID] [varchar](50) NOT NULL,
	[Case_ID] [varchar](50) NOT NULL,
	[DocumentType] [varchar](1000) NOT NULL,
	[ReminderDate] [datetime] NULL,
	[created_by_user] [varchar](250) NOT NULL,
	[created_date] [datetime] NULL,
	[modified_by_user] [varchar](250) NULL,
	[modified_date] [datetime] NULL,
	[Message] [varchar](4000) NULL,
	[isCompleted] [bit] NULL,
	[Complted_Date] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Required_Documents] ADD  DEFAULT ('h1') FOR [DomainID]
GO
ALTER TABLE [dbo].[Required_Documents] ADD  DEFAULT (getdate()) FOR [created_date]
GO
ALTER TABLE [dbo].[Required_Documents] ADD  DEFAULT ((0)) FOR [isCompleted]
GO
