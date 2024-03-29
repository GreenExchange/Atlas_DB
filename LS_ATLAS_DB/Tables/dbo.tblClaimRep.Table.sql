USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[tblClaimRep]    Script Date: 6/17/2019 2:22:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblClaimRep](
	[ClaimRep_Id] [int] IDENTITY(1,1) NOT NULL,
	[ClaimRep_LastName] [nvarchar](100) NULL,
	[ClaimRep_FirstName] [nvarchar](100) NULL,
	[Insurer_Id] [nvarchar](50) NOT NULL,
	[ClaimRep_Phone] [nvarchar](50) NULL,
	[ClaimRep_Fax] [nvarchar](50) NULL,
	[ClaimRep_Email] [nvarchar](50) NULL,
	[DomainId] [nvarchar](512) NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblClaimRep] ADD  DEFAULT ('h1') FOR [DomainId]
GO
