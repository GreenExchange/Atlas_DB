USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[tblWitnessType]    Script Date: 6/17/2019 2:22:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblWitnessType](
	[WitnessTypeID] [int] IDENTITY(1,1) NOT NULL,
	[WitnessType] [varchar](250) NOT NULL,
	[Description] [varchar](500) NULL,
	[DomainId] [varchar](50) NOT NULL,
	[created_by_user] [varchar](150) NULL,
	[created_date] [datetime] NULL,
	[modified_by_user] [varchar](150) NULL,
	[modified_date] [datetime] NULL,
 CONSTRAINT [PK_tblWitnessType] PRIMARY KEY CLUSTERED 
(
	[WitnessTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
