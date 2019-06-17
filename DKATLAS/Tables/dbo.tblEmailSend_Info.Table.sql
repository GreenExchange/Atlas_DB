USE [DKATLAS]
GO
/****** Object:  Table [dbo].[tblEmailSend_Info]    Script Date: 6/17/2019 2:53:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEmailSend_Info](
	[AutoID] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](50) NULL,
	[Case_ID] [nvarchar](50) NULL,
	[EmailID] [nvarchar](50) NULL,
	[Send_Status] [nvarchar](50) NULL
) ON [PRIMARY]
GO
