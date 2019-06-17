USE [LS_ATLAS_DB]
GO
/****** Object:  UserDefinedFunction [dbo].[FUNC_GET_FILING_FEES]    Script Date: 6/17/2019 2:30:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		SJR
-- ALTER date: 
-- Description:	
-- =============================================
CREATE FUNCTION [dbo].[FUNC_GET_FILING_FEES] 
(
	
	@CASE_ID VARCHAR(50)
)
RETURNS MONEY
AS
BEGIN
	
	DECLARE @Result MONEY

	
	SELECT @Result = 
	isnull(SUM(TRANSACTIONS_AMOUNT),0) FROM tblTransactions
	WHERE Transactions_Type like 'FFB%' AND Case_Id = @CASE_ID


	RETURN @Result

END
GO
