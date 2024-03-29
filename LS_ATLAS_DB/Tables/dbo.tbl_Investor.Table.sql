USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[tbl_Investor]    Script Date: 6/17/2019 2:22:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Investor](
	[InvestorId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Email] [varchar](250) NOT NULL,
	[ContactNo] [varchar](50) NULL,
	[Address] [varchar](250) NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](50) NULL,
	[Country] [varchar](50) NULL,
	[Zip] [int] NOT NULL,
	[Created_Date] [date] NOT NULL,
	[DomainId] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[InvestorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tbl_Investor] ADD  DEFAULT (getdate()) FOR [Created_Date]
GO
ALTER TABLE [dbo].[tbl_Investor]  WITH CHECK ADD  CONSTRAINT [FK_UserInvestor] FOREIGN KEY([UserId])
REFERENCES [dbo].[IssueTracker_Users] ([UserId])
GO
ALTER TABLE [dbo].[tbl_Investor] CHECK CONSTRAINT [FK_UserInvestor]
GO
