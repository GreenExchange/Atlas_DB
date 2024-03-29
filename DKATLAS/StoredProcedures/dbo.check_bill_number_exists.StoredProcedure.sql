USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[check_bill_number_exists]    Script Date: 6/17/2019 2:53:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--check_bill_number_exists 'localhost','HY2612'

CREATE PROCEDURE [dbo].[check_bill_number_exists]
(     
	@BillNumber	VARCHAR(MAX)
)
AS      
BEGIN      
	SELECT
		COUNT(*) AS count
	FROM
		tblcase C
		JOIN tblTreatment T ON T.Case_Id = C.Case_Id
	WHERE
		T.BILL_NUMBER	=	@BillNumber
END  

  
GO
