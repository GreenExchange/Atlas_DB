USE [DKATLAS]
GO
/****** Object:  View [dbo].[LCJ_VW_PaymentsGrid]    Script Date: 6/17/2019 2:53:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[LCJ_VW_PaymentsGrid]
AS
SELECT     dbo.tblProvider.Provider_Name, dbo.tblTransactions.Transactions_Id, dbo.tblTransactions.Case_Id, dbo.tblTransactions.Provider_Id, 
                      dbo.tblTransactions.Transactions_Type, dbo.tblTransactions.Transactions_Date, dbo.tblTransactions.Transactions_Amount,
					   dbo.tblTransactions.ChequeNo, dbo.tblTransactions.CheckDate, dbo.tblTransactions.BatchNo, 
                      dbo.tblTransactions.Transactions_Description, dbo.tblTransactions.Transactions_Fee, dbo.tblTransactions.User_Id, 
                      dbo.tblTransactions.Transactions_status, dbo.tblTransactions.Invoice_Id
FROM         dbo.tblTransactions INNER JOIN
                      dbo.tblProvider ON dbo.tblTransactions.Provider_Id = dbo.tblProvider.Provider_Id
GO
