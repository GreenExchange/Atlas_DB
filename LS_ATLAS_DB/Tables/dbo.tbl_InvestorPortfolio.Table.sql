USE [LS_ATLAS_DB]
GO
/****** Object:  Table [dbo].[tbl_InvestorPortfolio]    Script Date: 6/17/2019 2:22:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_InvestorPortfolio](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[InvestorId] [int] NOT NULL,
	[PortfolioId] [int] NOT NULL,
	[InvestmentAmount] [numeric](18, 2) NULL,
	[InvestmentPercentage] [numeric](5, 2) NULL,
	[Created_Date] [date] NOT NULL,
	[DomainId] [varchar](50) NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tbl_InvestorPortfolio] ADD  DEFAULT (getdate()) FOR [Created_Date]
GO
ALTER TABLE [dbo].[tbl_InvestorPortfolio]  WITH CHECK ADD  CONSTRAINT [FK_] FOREIGN KEY([PortfolioId])
REFERENCES [dbo].[tbl_Portfolio] ([Id])
GO
ALTER TABLE [dbo].[tbl_InvestorPortfolio] CHECK CONSTRAINT [FK_]
GO
ALTER TABLE [dbo].[tbl_InvestorPortfolio]  WITH CHECK ADD  CONSTRAINT [FK_Investor_InvestorPortfolio] FOREIGN KEY([InvestorId])
REFERENCES [dbo].[tbl_Investor] ([InvestorId])
GO
ALTER TABLE [dbo].[tbl_InvestorPortfolio] CHECK CONSTRAINT [FK_Investor_InvestorPortfolio]
GO
