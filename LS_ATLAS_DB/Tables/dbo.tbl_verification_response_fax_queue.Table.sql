USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[tbl_verification_response_fax_queue]    Script Date: 6/17/2019 2:22:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_verification_response_fax_queue](
	[pk_vr_fax_queue_id] [int] IDENTITY(1,1) NOT NULL,
	[DomainID] [varchar](50) NOT NULL,
	[I_VERIFICATION_ID] [int] NOT NULL,
	[FaxNumber] [varchar](50) NOT NULL,
	[SentByUser] [varchar](max) NOT NULL,
	[SentOn] [datetime] NOT NULL,
	[isDeleted] [bit] NULL,
	[IsAddedtoQueue] [bit] NULL,
	[AddedtoQueueDate] [datetime] NULL,
	[CoverPageText] [varchar](max) NULL,
	[AddToQueueCount] [int] NULL,
	[pk_vr_fax_queue_id_old] [int] NULL,
	[inprogress_send] [bit] NULL,
	[inprogress_download] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[pk_vr_fax_queue_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
