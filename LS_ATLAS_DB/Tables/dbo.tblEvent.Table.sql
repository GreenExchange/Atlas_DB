USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[tblEvent]    Script Date: 6/17/2019 2:22:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEvent](
	[Event_id] [int] IDENTITY(1,1) NOT NULL,
	[Case_id] [nvarchar](100) NULL,
	[EventTypeId] [int] NOT NULL,
	[EventStatusId] [int] NOT NULL,
	[Event_Date] [datetime] NOT NULL,
	[Event_Time] [datetime] NULL,
	[Event_Notes] [varchar](500) NULL,
	[Assigned_To] [varchar](max) NULL,
	[User_id] [varchar](500) NULL,
	[DRP_Id] [int] NULL,
	[arbitrator_id] [int] NULL,
	[Status] [bit] NULL,
	[DomainId] [nvarchar](512) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblEvent] ADD  CONSTRAINT [DF_tblEvent_Status]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[tblEvent] ADD  DEFAULT ('h1') FOR [DomainId]
GO
ALTER TABLE [dbo].[tblEvent]  WITH CHECK ADD  CONSTRAINT [fk_event_arbitrator_id] FOREIGN KEY([arbitrator_id])
REFERENCES [dbo].[TblArbitrator] ([ARBITRATOR_ID])
GO
ALTER TABLE [dbo].[tblEvent] CHECK CONSTRAINT [fk_event_arbitrator_id]
GO
