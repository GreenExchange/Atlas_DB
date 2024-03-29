USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[tblTrials]    Script Date: 6/17/2019 2:22:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTrials](
	[Trial_ID] [int] IDENTITY(1,1) NOT NULL,
	[CASE_ID] [nvarchar](50) NOT NULL,
	[Trial_Date] [datetime] NULL,
	[Trial_Status] [varchar](50) NULL,
	[Trial_Result] [varchar](50) NULL,
	[Trial_Type] [varchar](50) NULL,
	[Jury_Selection_Date] [datetime] NULL,
	[Judge_Name] [varchar](50) NULL,
	[Notes] [varchar](200) NULL,
	[Court_Cal_Number] [varchar](50) NULL,
	[Not_Filed_Date] [datetime] NULL,
	[Receipt_date] [datetime] NULL,
	[service_complete_date] [datetime] NULL,
	[DomainId] [nvarchar](512) NOT NULL,
 CONSTRAINT [PK_tblTrials] PRIMARY KEY CLUSTERED 
(
	[Trial_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblTrials] ADD  DEFAULT ('h1') FOR [DomainId]
GO
