USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[tbl_client_other_details]    Script Date: 6/17/2019 2:22:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_client_other_details](
	[DomainID] [varchar](50) NOT NULL,
	[CLIENT_ATTORNEY_NAME_1] [varchar](200) NULL,
	[POSTAGE_ADDRESS] [varchar](500) NULL,
	[NOTARY_DETAILS] [varchar](500) NULL,
	[NOTARY_SIGNED_BY_NAME] [nvarchar](200) NULL,
	[CLIENT_ATTORNEY_NAME_2] [varchar](200) NULL,
	[CLIENT_ATTORNEY_NAME_3] [varchar](200) NULL,
	[CLIENT_ATTORNEY_NAME_4] [varchar](200) NULL,
	[CLIENT_ATTORNEY_NAME_5] [varchar](200) NULL,
	[ADMINISTRATIVE_ASSISTANT] [nvarchar](200) NULL,
 CONSTRAINT [PK_tbl_client_other_details] PRIMARY KEY CLUSTERED 
(
	[DomainID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
