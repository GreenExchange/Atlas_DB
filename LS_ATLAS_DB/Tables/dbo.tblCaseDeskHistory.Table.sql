USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[tblCaseDeskHistory]    Script Date: 6/17/2019 2:22:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCaseDeskHistory](
	[History_Id] [int] IDENTITY(1,1) NOT NULL,
	[Case_Id] [nvarchar](50) NOT NULL,
	[Login_User_Id] [int] NOT NULL,
	[From_User_Id] [int] NULL,
	[To_User_Id] [int] NULL,
	[Date_Changed] [smalldatetime] NULL,
	[Change_Reason] [nvarchar](200) NULL,
	[bt_status] [bit] NULL,
	[DomainId] [nvarchar](512) NOT NULL,
 CONSTRAINT [PK_tblCaseDeskHistory] PRIMARY KEY CLUSTERED 
(
	[History_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblCaseDeskHistory] ADD  DEFAULT ('h1') FOR [DomainId]
GO
