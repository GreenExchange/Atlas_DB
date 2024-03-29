USE [DKATLAS]
GO
/****** Object:  Table [dbo].[Rebuttal_Status]    Script Date: 6/17/2019 2:53:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rebuttal_Status](
	[PK_Rebuttal_Status_ID] [int] IDENTITY(1,1) NOT NULL,
	[Rebuttal_Status] [varchar](200) NOT NULL,
	[created_by_user] [nvarchar](255) NOT NULL,
	[created_date] [datetime] NULL,
	[modified_by_user] [nvarchar](255) NULL,
	[modified_date] [datetime] NULL,
 CONSTRAINT [PK_Rebuttal_Status] PRIMARY KEY CLUSTERED 
(
	[Rebuttal_Status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
