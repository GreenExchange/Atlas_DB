USE [DKATLAS]
GO
/****** Object:  Table [dbo].[tblMotion_Status]    Script Date: 6/17/2019 2:53:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMotion_Status](
	[motion_status_id] [smallint] IDENTITY(1,1) NOT NULL,
	[status_desc] [varchar](50) NOT NULL,
	[status_hierarchy] [smallint] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblMotion_Status] ADD  CONSTRAINT [DF_tblMotion_Status_status_hierarchy]  DEFAULT ((0)) FOR [status_hierarchy]
GO
