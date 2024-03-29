USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[TblReviewingDoctor]    Script Date: 6/17/2019 2:22:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblReviewingDoctor](
	[Doctor_id] [int] IDENTITY(1,1) NOT NULL,
	[Doctor_Name] [varchar](100) NOT NULL,
	[Active] [bit] NOT NULL,
	[DomainId] [nvarchar](50) NULL,
	[created_by_user] [nvarchar](255) NOT NULL,
	[created_date] [datetime] NULL,
	[modified_by_user] [nvarchar](255) NULL,
	[modified_date] [datetime] NULL,
 CONSTRAINT [PK_TblReviewingDoctor] PRIMARY KEY CLUSTERED 
(
	[Doctor_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TblReviewingDoctor] ADD  CONSTRAINT [DF_TblReviewingDoctor_Active]  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[TblReviewingDoctor] ADD  DEFAULT ('h1') FOR [DomainId]
GO
ALTER TABLE [dbo].[TblReviewingDoctor] ADD  DEFAULT ('admin') FOR [created_by_user]
GO
