USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[Get_CaseId_From_Bill_Number]    Script Date: 6/17/2019 2:54:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Get_CaseId_From_Bill_Number]
(     
	@BillNumber	VARCHAR(MAX)
)
AS      
BEGIN      
	SELECT DISTINCT TOP 1
		C.Case_Id
	FROM
		tblcase C
		JOIN tblTreatment T ON T.Case_Id = C.Case_Id
	WHERE
		T.BILL_NUMBER	=	@BillNumber
END  
GO
