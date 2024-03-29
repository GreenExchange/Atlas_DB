USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[Task]    Script Date: 6/17/2019 2:22:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Task](
	[Task_ID] [int] IDENTITY(1,1) NOT NULL,
	[DomainID] [varchar](50) NULL,
	[Case_ID] [varchar](50) NULL,
	[Task_Type_ID] [int] NULL,
	[Priority_ID] [int] NULL,
	[Task_Status_ID] [int] NULL,
	[Assign_User_ID] [int] NULL,
	[TaskDate] [datetime] NULL,
	[Reminder] [bit] NULL,
	[ReminderDateTime] [datetime] NULL,
	[Comments] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NULL,
	[RevisedDate] [datetime] NULL,
	[Created_User_ID] [int] NULL,
	[Revised_User_ID] [int] NULL,
	[Completed_Date] [datetime] NULL,
	[Completed_By_User] [int] NULL,
	[DueDate] [datetime] NULL,
 CONSTRAINT [PK_Task] PRIMARY KEY CLUSTERED 
(
	[Task_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
