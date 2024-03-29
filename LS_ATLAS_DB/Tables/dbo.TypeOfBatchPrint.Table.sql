USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[TypeOfBatchPrint]    Script Date: 6/17/2019 2:22:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeOfBatchPrint](
	[Type_Id] [int] IDENTITY(1,1) NOT NULL,
	[Printing_Type] [varchar](150) NULL,
	[Domain_Id] [varchar](50) NULL,
 CONSTRAINT [PK_TypeOfBatchPrint] PRIMARY KEY CLUSTERED 
(
	[Type_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
