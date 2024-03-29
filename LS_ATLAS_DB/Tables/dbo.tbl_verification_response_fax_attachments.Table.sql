USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[tbl_verification_response_fax_attachments]    Script Date: 6/17/2019 2:22:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_verification_response_fax_attachments](
	[pk_vr_fax_attachment_id] [int] IDENTITY(1,1) NOT NULL,
	[I_VERIFICATION_ID] [int] NOT NULL,
	[FaxImageID] [bigint] NOT NULL,
	[DomainID] [varchar](50) NULL,
	[isDeleted] [bit] NULL,
	[pk_vr_fax_attachment_id_old] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tbl_verification_response_fax_attachments]  WITH CHECK ADD  CONSTRAINT [tbl_verification_response_fax_attachments_I_VERIFICATION_ID] FOREIGN KEY([I_VERIFICATION_ID])
REFERENCES [dbo].[TXN_VERIFICATION_REQUEST] ([I_VERIFICATION_ID])
GO
ALTER TABLE [dbo].[tbl_verification_response_fax_attachments] CHECK CONSTRAINT [tbl_verification_response_fax_attachments_I_VERIFICATION_ID]
GO
