USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[Get_CaseId_From_Bill_Number]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Get_CaseId_From_Bill_Number 'localhost','HY2612'

CREATE PROCEDURE [dbo].[Get_CaseId_From_Bill_Number]
(     
	@DomainId	VARCHAR(50),
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
		C.DomainId		=	@DomainId AND
		T.DomainId		=	@DomainId AND
		T.BILL_NUMBER	=	@BillNumber
END  

  
GO
