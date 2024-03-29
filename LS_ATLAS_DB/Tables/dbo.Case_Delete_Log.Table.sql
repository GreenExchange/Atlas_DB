USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[Case_Delete_Log]    Script Date: 6/17/2019 2:22:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Case_Delete_Log](
	[LogId] [int] IDENTITY(1,1) NOT NULL,
	[Log_Desc] [varchar](4000) NULL,
	[Case_Id] [nvarchar](50) NULL,
	[User_Id] [nvarchar](50) NULL,
	[Deleted_Date] [datetime] NULL,
	[DomainId] [varchar](50) NULL,
 CONSTRAINT [PK_Case_Delete_Log] PRIMARY KEY CLUSTERED 
(
	[LogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
