USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[tblCaseWitnessList]    Script Date: 6/17/2019 2:22:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCaseWitnessList](
	[WitnessId] [int] IDENTITY(1,1) NOT NULL,
	[Case_Id] [nvarchar](100) NULL,
	[DomainId] [nvarchar](100) NULL,
	[Name] [varchar](500) NULL,
	[Address] [varchar](max) NULL,
	[City] [varchar](150) NULL,
	[State] [varchar](150) NULL,
	[Zip] [varchar](50) NULL,
	[Email] [varchar](150) NULL,
	[MobileNumber] [varchar](50) NULL,
	[PhoneNumber] [varchar](50) NULL,
	[FaxNumber] [varchar](50) NULL,
	[Notes] [varchar](max) NULL,
	[CreatedBy] [varchar](100) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [varchar](100) NULL,
	[UpdatedDate] [datetime] NULL,
	[WitnessTypeID] [int] NULL,
 CONSTRAINT [PK_tblCaseWitnessList] PRIMARY KEY CLUSTERED 
(
	[WitnessId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
