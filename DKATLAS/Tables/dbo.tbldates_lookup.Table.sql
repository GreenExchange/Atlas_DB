USE [DKATLAS]
GO
/****** Object:  Table [dbo].[tbldates_lookup]    Script Date: 6/17/2019 2:53:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbldates_lookup](
	[DateKey] [int] NOT NULL,
	[DateFull] [datetime] NULL,
	[CharacterDate] [varchar](10) NULL,
	[FullYear] [char](4) NULL,
	[QuarterNumber] [tinyint] NULL,
	[WeekNumber] [tinyint] NULL,
	[WeekDayName] [varchar](10) NULL,
	[MonthDay] [tinyint] NULL,
	[MonthName] [varchar](12) NULL,
	[YearDay] [smallint] NULL,
	[DateDefinition] [varchar](100) NULL,
	[WeekDay] [tinyint] NULL,
	[MonthNumber] [tinyint] NULL,
	[Holiday] [bit] NULL,
 CONSTRAINT [PK__tbldates_lookup__1D5142F3] PRIMARY KEY CLUSTERED 
(
	[DateKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tbldates_lookup] ADD  CONSTRAINT [DF_tbldates_lookup_Holiday]  DEFAULT ((0)) FOR [Holiday]
GO
