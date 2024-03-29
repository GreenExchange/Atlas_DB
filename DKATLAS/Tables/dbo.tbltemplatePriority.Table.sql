USE [DKATLAS]
GO
/****** Object:  Table [dbo].[tbltemplatePriority]    Script Date: 6/17/2019 2:53:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbltemplatePriority](
	[Priority_Id] [int] IDENTITY(1,1) NOT NULL,
	[Process_Id] [int] NULL,
	[Document_Id] [int] NULL,
	[Priority] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tbltemplatePriority]  WITH CHECK ADD  CONSTRAINT [FK__tbltempla__iProc__7E37BEF6] FOREIGN KEY([Process_Id])
REFERENCES [dbo].[tblProcess] ([Process_Id])
GO
ALTER TABLE [dbo].[tbltemplatePriority] CHECK CONSTRAINT [FK__tbltempla__iProc__7E37BEF6]
GO
