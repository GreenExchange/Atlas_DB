USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[ChangeBillStatusToImported]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ChangeBillStatusToImported]
(
@BillNumbers [BillDetails]  READONLY
)
AS
BEGIN

UPDATE tbltreatment 
SET DocumentStatus = 'Imported'
FROM tbltreatment t
INNER JOIN @BillNumbers b ON b.CaseId = t.Case_Id 
AND	b.BillNumber = t.BILL_NUMBER AND b.DomainId = t.DomainId


END

GO
