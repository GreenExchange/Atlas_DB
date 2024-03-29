USE [DKATLAS]
GO
/****** Object:  Table [dbo].[case_search_saved_query]    Script Date: 6/17/2019 2:53:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[case_search_saved_query](
	[pk_search_query_id] [int] IDENTITY(1,1) NOT NULL,
	[column_value] [varchar](max) NULL,
	[column_name] [varchar](max) NULL,
	[query_name] [nvarchar](250) NULL,
	[userid] [int] NULL,
	[modified_userid] [int] NULL,
	[create_date] [datetime] NULL,
	[modified_date] [datetime] NULL,
	[providersel] [varchar](max) NULL,
	[insurancesel] [varchar](max) NULL,
	[currentstatussel] [varchar](max) NULL,
	[initialstatussel] [varchar](max) NULL,
	[case_id] [varchar](100) NULL,
	[oldcaseid] [varchar](100) NULL,
	[injuredname] [varchar](100) NULL,
	[insuredname] [varchar](100) NULL,
	[policyno] [varchar](100) NULL,
	[claimno] [varchar](100) NULL,
	[billnumber] [varchar](200) NULL,
	[indexoraaano] [varchar](100) NULL,
	[denailreasonid] [int] NULL,
	[courtsel] [int] NULL,
	[defendantsel] [int] NULL,
	[reviewingdoctor] [int] NULL,
	[providergroupsel] [varchar](100) NULL,
	[insurancegroupsel] [varchar](100) NULL,
	[date_opened_from] [varchar](10) NULL,
	[date_opened_to] [varchar](10) NULL,
	[dos_from] [varchar](10) NULL,
	[dos_to] [varchar](10) NULL,
	[date_status_changed_from] [varchar](10) NULL,
	[date_status_changed_to] [varchar](10) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
