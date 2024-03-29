USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[tblAction]    Script Date: 6/17/2019 2:22:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAction](
	[Action_id] [int] IDENTITY(1,1) NOT NULL,
	[DenialReasons_Id] [int] NULL,
	[Action_type] [nvarchar](50) NULL,
	[DomainId] [nvarchar](512) NOT NULL,
 CONSTRAINT [PK_tblAction] PRIMARY KEY CLUSTERED 
(
	[Action_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblAction] ADD  DEFAULT ('h1') FOR [DomainId]
GO
ALTER TABLE [dbo].[tblAction]  WITH CHECK ADD  CONSTRAINT [AddDenialReason] FOREIGN KEY([DenialReasons_Id])
REFERENCES [dbo].[tblDenialReasons] ([DenialReasons_Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblAction] CHECK CONSTRAINT [AddDenialReason]
GO
