USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[tblTriggerCC]    Script Date: 6/17/2019 2:22:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTriggerCC](
	[AutoID] [int] IDENTITY(1,1) NOT NULL,
	[TriggerTypeId] [int] NULL,
	[UserID] [int] NULL,
	[DomainId] [varchar](150) NULL,
 CONSTRAINT [PK_tblTriggerCC] PRIMARY KEY CLUSTERED 
(
	[AutoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
