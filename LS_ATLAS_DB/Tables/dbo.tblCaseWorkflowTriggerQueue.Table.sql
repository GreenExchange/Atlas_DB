USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[tblCaseWorkflowTriggerQueue]    Script Date: 6/17/2019 2:22:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCaseWorkflowTriggerQueue](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Case_Id] [varchar](100) NULL,
	[DomainId] [varchar](100) NULL,
	[TriggerTypeId] [int] NOT NULL,
	[EmailTo] [varchar](250) NULL,
	[EmailCC] [varchar](250) NULL,
	[EmailBCC] [varchar](250) NULL,
	[EmailSubject] [varchar](500) NULL,
	[EmailBody] [varchar](max) NULL,
	[InProgress] [bit] NULL,
	[IsProcessed] [bit] NULL,
	[ProcessedDate] [datetime] NULL,
	[CreatedBy] [varchar](100) NULL,
	[CreatedDate] [datetime] NULL,
	[IsDeleted] [bit] NULL,
	[MotionMappingId] [int] NULL,
 CONSTRAINT [PK_tblCaseWorkflowTriggerQueue] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblCaseWorkflowTriggerQueue] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[tblCaseWorkflowTriggerQueue]  WITH CHECK ADD  CONSTRAINT [FK_tblCaseWorkflowTriggerQueue_TriggerTypeId_tblTriggerType] FOREIGN KEY([TriggerTypeId])
REFERENCES [dbo].[tblTriggerType] ([Id])
GO
ALTER TABLE [dbo].[tblCaseWorkflowTriggerQueue] CHECK CONSTRAINT [FK_tblCaseWorkflowTriggerQueue_TriggerTypeId_tblTriggerType]
GO
