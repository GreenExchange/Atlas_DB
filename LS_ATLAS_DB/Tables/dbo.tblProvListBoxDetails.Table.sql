USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[tblProvListBoxDetails]    Script Date: 6/17/2019 2:22:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProvListBoxDetails](
	[Auto_id] [int] IDENTITY(1,1) NOT NULL,
	[BatchNumber] [nvarchar](50) NULL,
	[DateReceived] [datetime] NULL,
	[ProcessDate] [datetime] NULL,
	[SpecialNote] [nvarchar](500) NULL,
	[SpecialInstruction] [nvarchar](500) NULL,
	[No_Of_Cases] [nvarchar](500) NULL,
	[Created_By] [nvarchar](50) NULL,
	[Predestinated_Path] [nvarchar](100) NULL,
	[DomainId] [nvarchar](512) NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblProvListBoxDetails] ADD  DEFAULT ('h1') FOR [DomainId]
GO
