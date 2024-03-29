USE [DKATLAS]
GO
/****** Object:  Table [dbo].[Billing_Packet]    Script Date: 6/17/2019 2:53:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Billing_Packet](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Case_ID] [varchar](50) NOT NULL,
	[Packeted_Case_ID] [varchar](50) NULL,
	[Notes] [varchar](max) NULL,
	[created_by_user] [nvarchar](255) NULL,
	[created_date] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Billing_Packet] ADD  DEFAULT (getdate()) FOR [created_date]
GO
