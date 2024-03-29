USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[tblServiceType]    Script Date: 6/17/2019 2:22:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblServiceType](
	[ServiceType_ID] [int] IDENTITY(1,1) NOT NULL,
	[ServiceType] [varchar](25) NULL,
	[ServiceDesc] [varchar](50) NULL,
	[DomainId] [nvarchar](512) NOT NULL,
	[created_by_user] [varchar](255) NULL,
	[created_date] [datetime] NULL,
	[modified_by_user] [varchar](255) NULL,
	[modified_date] [datetime] NULL,
	[ServiceType_ID_Old] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblServiceType] ADD  CONSTRAINT [DF__tblServic__Domai__038683F8]  DEFAULT ('h1') FOR [DomainId]
GO
