USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[TransactionType_DDL]    Script Date: 6/17/2019 2:54:07 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[TransactionType_DDL]
AS
BEGIN
    SELECT '0' AS payment_value,' ---Select--- ' AS payment_type, '0' AS autoid 
	UNION
	SELECT   DISTINCT payment_value, 
					payment_type, 
					autoid
	FROM         tblTransactionType
	WHERE     (1 = 1) order by autoid
END

GO
