USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[TXN_CASE_Treating_Doctor]    Script Date: 6/17/2019 2:22:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TXN_CASE_Treating_Doctor](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TREATMENT_ID] [int] NULL,
	[DOCTOR_ID] [int] NULL,
	[DomainId] [nvarchar](512) NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TXN_CASE_Treating_Doctor] ADD  DEFAULT ('h1') FOR [DomainId]
GO
ALTER TABLE [dbo].[TXN_CASE_Treating_Doctor]  WITH CHECK ADD  CONSTRAINT [FK__TXN_CASE___TREAT__2B947552] FOREIGN KEY([TREATMENT_ID])
REFERENCES [dbo].[tblTreatment] ([Treatment_Id])
GO
ALTER TABLE [dbo].[TXN_CASE_Treating_Doctor] CHECK CONSTRAINT [FK__TXN_CASE___TREAT__2B947552]
GO
