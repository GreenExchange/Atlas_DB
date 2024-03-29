USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[tblAutoEmailRecipients]    Script Date: 6/17/2019 2:22:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAutoEmailRecipients](
	[pk_recipient_id] [int] IDENTITY(1,1) NOT NULL,
	[DomainId] [varchar](50) NOT NULL,
	[ToEmail] [varchar](max) NOT NULL,
	[CCEMail] [varchar](max) NULL,
	[BCCEmail] [varchar](max) NULL,
	[fk_report_type_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[pk_recipient_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblAutoEmailRecipients]  WITH CHECK ADD  CONSTRAINT [tblAutoEmailRecipients_fk_report_type_id] FOREIGN KEY([fk_report_type_id])
REFERENCES [dbo].[tblAutoEmailReportType] ([pk_report_type_id])
GO
ALTER TABLE [dbo].[tblAutoEmailRecipients] CHECK CONSTRAINT [tblAutoEmailRecipients_fk_report_type_id]
GO
