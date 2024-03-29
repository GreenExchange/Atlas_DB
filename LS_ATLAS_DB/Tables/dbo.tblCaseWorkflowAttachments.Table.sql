USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[tblCaseWorkflowAttachments]    Script Date: 6/17/2019 2:22:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCaseWorkflowAttachments](
	[AutoID] [int] IDENTITY(1,1) NOT NULL,
	[WorkflowQueue_Id] [bigint] NULL,
	[AttachmentImageID] [bigint] NULL,
	[DomainId] [varchar](150) NULL,
 CONSTRAINT [PK_tblCaseWorkflowAttachments] PRIMARY KEY CLUSTERED 
(
	[AutoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
