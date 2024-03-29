USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_Get_Last_Invoice_Date]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[LCJ_Get_Last_Invoice_Date]
(
@PROVIDER_ID NVARCHAR(100)
)

 AS
	DECLARE @STR_DATE DATETIME
	SELECT @STR_DATE = CONVERT(CHAR(10), MAX(account_date) ,101) FROM tblclientaccount
	WHERE provider_Id = @PROVIDER_ID

	IF ((@STR_DATE IS NULL) OR (@STR_DATE = ''))
		BEGIN
			SELECT @STR_DATE = CONVERT(CHAR(10), MIN(Transactions_Date) ,101) FROM tbltransactions
			WHERE Provider_id = @PROVIDER_ID
		END
	SELECT @STR_DATE
GO
