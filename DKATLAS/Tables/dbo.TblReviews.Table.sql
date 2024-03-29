USE [DKATLAS]
GO
/****** Object:  Table [dbo].[TblReviews]    Script Date: 6/17/2019 2:53:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblReviews](
	[Review_id] [int] IDENTITY(1,1) NOT NULL,
	[Case_id] [varchar](50) NOT NULL,
	[Review_Doctor] [int] NOT NULL,
	[Review_Date] [datetime] NOT NULL,
	[Service_type] [tinyint] NOT NULL,
	[Review_Notes] [varchar](500) NULL,
	[User_id] [varchar](50) NOT NULL,
 CONSTRAINT [PK_TblReviews] PRIMARY KEY CLUSTERED 
(
	[Review_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
