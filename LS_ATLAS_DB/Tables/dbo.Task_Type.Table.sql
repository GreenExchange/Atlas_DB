USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[Task_Type]    Script Date: 6/17/2019 2:22:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Task_Type](
	[Task_Type_ID] [int] IDENTITY(1,1) NOT NULL,
	[DomainID] [varchar](50) NOT NULL,
	[Description] [nvarchar](100) NOT NULL,
	[Comments] [nvarchar](100) NULL,
	[Deadline_Day] [varchar](10) NULL,
	[created_by_user] [nvarchar](255) NOT NULL,
	[created_date] [datetime] NULL,
	[modified_by_user] [nvarchar](255) NULL,
	[modified_date] [datetime] NULL,
	[Task_Type_ID_Old] [int] NULL,
 CONSTRAINT [PK_task_Type] PRIMARY KEY CLUSTERED 
(
	[DomainID] ASC,
	[Description] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Task_Type] ADD  CONSTRAINT [DF__Task_Type__creat__2784B8A3]  DEFAULT ('admin') FOR [created_by_user]
GO
ALTER TABLE [dbo].[Task_Type] ADD  CONSTRAINT [DF_task_Type_created_date]  DEFAULT (getdate()) FOR [created_date]
GO
