USE [DKATLAS]
GO
/****** Object:  Table [dbo].[tbl_Case_Denial]    Script Date: 6/17/2019 2:53:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Case_Denial](
	[PK_ID] [int] IDENTITY(1,1) NOT NULL,
	[FK_Denial_ID] [int] NULL,
	[Case_Id] [nvarchar](50) NULL,
 CONSTRAINT [PK_tbl_Case_Denial] PRIMARY KEY CLUSTERED 
(
	[PK_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tbl_Case_Denial]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Case_Denial_MST_DenialReasons] FOREIGN KEY([FK_Denial_ID])
REFERENCES [dbo].[MST_DenialReasons] ([PK_Denial_ID])
GO
ALTER TABLE [dbo].[tbl_Case_Denial] CHECK CONSTRAINT [FK_tbl_Case_Denial_MST_DenialReasons]
GO
