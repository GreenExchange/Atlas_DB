USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[Task_Status]    Script Date: 6/17/2019 2:22:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Task_Status](
	[Task_Status_ID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](100) NULL,
	[Comments] [nvarchar](100) NULL,
	[Created_Date] [datetime] NOT NULL,
 CONSTRAINT [PK_Task_Status] PRIMARY KEY CLUSTERED 
(
	[Task_Status_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Task_Status] ADD  CONSTRAINT [DF_Task_Status_Created_Date]  DEFAULT (getdate()) FOR [Created_Date]
GO
