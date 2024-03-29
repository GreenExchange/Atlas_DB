USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[tbl_Program]    Script Date: 6/17/2019 2:22:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Program](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Advance_Rate] [decimal](18, 2) NULL,
	[Buyout] [bit] NULL,
	[Fixed_Fee_Rate] [decimal](18, 2) NULL,
	[Fixed_Fee_Rate_Time] [int] NULL,
	[Period_Fee_Rate] [decimal](18, 2) NULL,
	[Period_Fee_Time_Frame] [int] NULL,
	[Created_Date] [date] NULL,
	[DomainId] [nvarchar](50) NOT NULL,
	[Name] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
