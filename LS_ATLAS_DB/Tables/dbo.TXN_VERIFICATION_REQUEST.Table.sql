USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[TXN_VERIFICATION_REQUEST]    Script Date: 6/17/2019 2:22:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TXN_VERIFICATION_REQUEST](
	[I_VERIFICATION_ID] [int] IDENTITY(1,1) NOT NULL,
	[SZ_CASE_ID] [nvarchar](20) NOT NULL,
	[DT_VERIFICATION_RECEIVED] [datetime] NULL,
	[DT_VERIFICATION_REPLIED] [datetime] NULL,
	[SZ_NOTES] [nvarchar](2000) NULL,
	[SZ_USER_ID] [nvarchar](20) NOT NULL,
	[DomainID] [varchar](50) NULL,
	[RequestImageID] [bigint] NULL,
	[VerificationResponse] [varchar](max) NULL,
	[FaxQueueID] [bigint] NULL,
	[FaxAcknowledgementImageID] [bigint] NULL,
	[FaxStatus] [varchar](max) NULL,
	[ManualResponseImageID] [bigint] NULL,
	[ResendCount] [int] NULL,
	[I_VERIFICATION_ID_OLD] [int] NULL,
	[vr_type_Id] [int] NULL,
 CONSTRAINT [PK_TXN_VERIFICATION_REQUEST] PRIMARY KEY CLUSTERED 
(
	[I_VERIFICATION_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
