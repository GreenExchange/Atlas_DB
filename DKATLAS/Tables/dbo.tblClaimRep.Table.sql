USE [DKATLAS]
GO
/****** Object:  Table [dbo].[tblClaimRep]    Script Date: 6/17/2019 2:53:57 AM ******/
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
	[ClaimRep_Email] [nvarchar](50) NULL
) ON [PRIMARY]
GO
