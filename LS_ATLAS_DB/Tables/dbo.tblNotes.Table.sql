USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[tblNotes]    Script Date: 6/17/2019 2:22:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblNotes](
	[Notes_ID] [int] IDENTITY(1,1) NOT NULL,
	[Notes_Desc] [varchar](3000) NULL,
	[Notes_Type] [varchar](50) NULL,
	[Notes_Priority] [varchar](50) NULL,
	[Case_Id] [varchar](50) NOT NULL,
	[Notes_Date] [smalldatetime] NULL,
	[User_Id] [varchar](50) NULL,
	[DomainId] [varchar](512) NOT NULL,
	[WorkflowQueueID] [int] NULL,
 CONSTRAINT [PK_tblNotes] PRIMARY KEY CLUSTERED 
(
	[Notes_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblNotes] ADD  CONSTRAINT [DF_tblNotes_Notes_Date]  DEFAULT (getdate()) FOR [Notes_Date]
GO
ALTER TABLE [dbo].[tblNotes] ADD  CONSTRAINT [DF_tblNotes_User_Id]  DEFAULT ('system') FOR [User_Id]
GO
ALTER TABLE [dbo].[tblNotes] ADD  CONSTRAINT [DF__tblNotes__Domain__5D60DB10]  DEFAULT ('h1') FOR [DomainId]
GO
