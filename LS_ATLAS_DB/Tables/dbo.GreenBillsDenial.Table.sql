USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[GreenBillsDenial]    Script Date: 6/17/2019 2:22:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GreenBillsDenial](
	[GB_DENIAL_REASON] [varchar](200) NULL,
	[RFA_DENIAL_REASON] [varchar](200) NULL,
	[DomainID] [varchar](200) NOT NULL
) ON [PRIMARY]
GO
