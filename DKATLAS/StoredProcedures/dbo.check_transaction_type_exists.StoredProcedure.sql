USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[check_transaction_type_exists]    Script Date: 6/17/2019 2:53:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--check_transaction_type_exists 'localhost','Pre-Litigation Collected (PreC - From Insurer)'

CREATE PROCEDURE [dbo].[check_transaction_type_exists]
(     
	@TransactionType	VARCHAR(MAX)
)
AS      
BEGIN      
	SELECT
		COUNT(*) AS count
	FROM
		tblTransactionType
	WHERE
		payment_type	=	@TransactionType
END  
GO
