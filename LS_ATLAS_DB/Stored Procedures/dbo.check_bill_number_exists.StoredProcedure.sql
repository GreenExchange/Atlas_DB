USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[check_bill_number_exists]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--check_bill_number_exists 'localhost','HY2612'

CREATE PROCEDURE [dbo].[check_bill_number_exists]
(     
	@DomainId	VARCHAR(50),
	@BillNumber	VARCHAR(100)
)
AS      
BEGIN      
	SELECT
		COUNT(1) AS count
	FROM
		tblTreatment T (NOLOCK)
	WHERE
		T.DomainId		=	@DomainId AND
		T.BILL_NUMBER	=	@BillNumber
END  

  
GO
