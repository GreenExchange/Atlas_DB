USE [DKATLAS]
GO
/****** Object:  Table [dbo].[GreenBillsProviders]    Script Date: 6/17/2019 2:53:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GreenBillsProviders](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SZ_COMPANY_ID] [nvarchar](20) NOT NULL,
	[SZ_OFFICE_ID] [nvarchar](20) NOT NULL,
	[PROVIDER_ID] [int] NULL,
	[Gbb_Type] [varchar](20) NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[GreenBillsProviders]  WITH CHECK ADD  CONSTRAINT [FK__GreenBill__PROVI__3DD3EC75] FOREIGN KEY([PROVIDER_ID])
REFERENCES [dbo].[tblProvider] ([Provider_Id])
GO
ALTER TABLE [dbo].[GreenBillsProviders] CHECK CONSTRAINT [FK__GreenBill__PROVI__3DD3EC75]
GO
