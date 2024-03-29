USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[tbl_ip_tracker]    Script Date: 6/17/2019 2:22:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_ip_tracker](
	[Auto_ID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NULL,
	[UserId] [varchar](50) NULL,
	[REMOTE_ADDR] [nvarchar](2000) NULL,
	[IPAdd] [nvarchar](500) NULL,
	[Login_Date] [datetime] NULL,
	[DomainID] [varchar](50) NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tbl_ip_tracker] ADD  CONSTRAINT [DF_tbl_ip_tracker_Login_Date]  DEFAULT (getdate()) FOR [Login_Date]
GO
