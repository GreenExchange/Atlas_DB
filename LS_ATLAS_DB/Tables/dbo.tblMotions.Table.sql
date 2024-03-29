USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[tblMotions]    Script Date: 6/17/2019 2:22:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMotions](
	[Motion_ID] [int] IDENTITY(1,1) NOT NULL,
	[Case_ID] [nvarchar](50) NULL,
	[Motion_Date] [datetime] NULL,
	[Motion_Status] [varchar](50) NULL,
	[Our_Motion_Type] [varchar](50) NULL,
	[Defendent_Motion_Type] [varchar](200) NULL,
	[Opposition_Due_Date] [datetime] NULL,
	[Reply_Due_Date] [datetime] NULL,
	[Notes] [varchar](200) NULL,
	[cross_motion] [char](1) NULL,
	[whose_motion] [nvarchar](50) NULL,
	[room] [nvarchar](50) NULL,
	[part] [nvarchar](50) NULL,
	[judge_name] [nvarchar](50) NULL,
	[time_duration] [varchar](50) NULL,
	[DomainId] [nvarchar](512) NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblMotions] ADD  DEFAULT ('h1') FOR [DomainId]
GO
