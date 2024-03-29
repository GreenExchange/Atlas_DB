USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[Bulk_Payment_Posting_Save]    Script Date: 6/17/2019 2:53:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[Bulk_Payment_Posting_Save]
(     
	@BillNumber				VARCHAR(MAX),
	@Transactions_Amount	MONEY,  
	@ChequeNo				VARCHAR(50),
	@CheckDate				DATETIME = Null,
	@TransactionsType		VARCHAR(MAX),  
	@Notes					VARCHAR(MAX),  
	@User_Id				VARCHAR(100),
	@TransactionDate		DATETIME,
	@BatchNo				VARCHAR(MAX)
)
AS      
BEGIN      
	DECLARE @Case_Id				VARCHAR(MAX) 
	DECLARE @Provider_Id			VARCHAR(MAX);
	DECLARE @transactions_status	CHAR(1)=''
	DECLARE @Transactions_Type		NVARCHAR(10)

	SELECT TOP 1
		@Case_Id		=	C.Case_Id,
		@Provider_Id	=	C.Provider_Id
	FROM 
		tblcase C 
		JOIN tblTreatment T ON T.Case_Id = C.Case_Id 
	WHERE 
		T.BILL_NUMBER	=	@BillNumber

	SELECT TOP 1
		@Transactions_Type	=	payment_value 
	FROM 
		tblTransactionType
	WHERE 
		LOWER(payment_type)	=	LOWER(@TransactionsType)

	EXEC LCJ_AddPaymentsTransactions @Case_Id,@Provider_Id,@Transactions_Amount,@TransactionDate,@Transactions_Type,@Notes,@User_Id,@transactions_status,@ChequeNo,@CheckDate,@BatchNo


END  

  
GO
