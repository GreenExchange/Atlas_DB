USE [DKATLAS]
GO
/****** Object:  Table [dbo].[tblPrintJobs]    Script Date: 6/17/2019 2:53:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPrintJobs](
	[PrintJobs_ID] [int] IDENTITY(1,1) NOT NULL,
	[Case_Id] [nvarchar](100) NULL,
	[Process_Id] [int] NULL,
	[Date_Printed] [datetime] NULL,
	[Date_Submitted] [datetime] NULL,
	[Printed] [bit] NULL,
	[User_Id] [nvarchar](100) NULL,
 CONSTRAINT [pkPrintJobsID] PRIMARY KEY CLUSTERED 
(
	[PrintJobs_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblPrintJobs]  WITH CHECK ADD  CONSTRAINT [FK__tblPrintJ__iProc__797309D9] FOREIGN KEY([Process_Id])
REFERENCES [dbo].[tblProcess] ([Process_Id])
GO
ALTER TABLE [dbo].[tblPrintJobs] CHECK CONSTRAINT [FK__tblPrintJ__iProc__797309D9]
GO
