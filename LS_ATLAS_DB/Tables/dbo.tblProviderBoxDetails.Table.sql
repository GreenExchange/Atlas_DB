USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[tblProviderBoxDetails]    Script Date: 6/17/2019 2:22:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProviderBoxDetails](
	[auto_id] [int] IDENTITY(1,1) NOT NULL,
	[provider_id] [varchar](50) NULL,
	[provider_name] [varchar](100) NULL,
	[box_rec_date] [datetime] NULL,
	[no_of_cases] [int] NULL,
	[status] [varchar](50) NULL,
	[file_scanned] [int] NULL,
	[file_pending] [int] NULL,
	[batch_no] [varchar](50) NULL,
	[UserName] [nvarchar](510) NULL,
	[DomainId] [nvarchar](512) NOT NULL,
UNIQUE NONCLUSTERED 
(
	[batch_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblProviderBoxDetails] ADD  DEFAULT ('h1') FOR [DomainId]
GO
