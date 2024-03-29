USE [DKATLAS]
GO
/****** Object:  UserDefinedFunction [dbo].[Func_Geico_stip_query]    Script Date: 6/17/2019 2:53:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		srosenthal
-- ALTER date: 6/15/2008
-- Description:	geico settlement stip query
-- =============================================
CREATE FUNCTION [dbo].[Func_Geico_stip_query] 
(	
	
	@batch varchar(50),@subbatch int
	 
)
RETURNS TABLE 
AS
RETURN 
(
	
	SELECT     TOP (100) PERCENT tblInsuranceCompany.InsuranceCompany_Name, tblProvider.Provider_Name, tblCourt.Court_Name, tblCourt.Court_Venue, 
                      tblcase.Case_Id, tblcase.Case_AutoId, tblcase.Case_Code, tblcase.Ins_Claim_Number, tblSettlements.Settlement_Id, 
                      tblSettlements.Settlement_Amount, tblSettlements.Settlement_Int, tblSettlements.Settlement_Af, tblSettlements.Settlement_Ff, 
                      convert(varchar(20),tblSettlements.Settlement_Date,1) as Settlement_Date, tblcase.InjuredParty_FirstName + N' ' + tblcase.InjuredParty_LastName AS InjuredParty, tblcase.IndexOrAAA_Number, 
                      LEFT(tblTreatment.DateOfService_Start, LEN(tblTreatment.DateOfService_Start) - 8) + ' - ' + LEFT(tblTreatment.DateOfService_End, 
                      LEN(tblTreatment.DateOfService_End) - 8) AS DOS, CASE WHEN Tbltreatment.treatment_id IS NULL THEN CONVERT(MONEY, 
                      ISNULL(tblcase.Claim_Amount, 0)) - CONVERT(MONEY, ISNULL(tblcase.Paid_Amount, 0)) ELSE CONVERT(MONEY, ISNULL(Tbltreatment.Claim_Amount, 
                      0)) - CONVERT(MONEY, ISNULL(Tbltreatment.Paid_Amount, 0)) END AS BALANCE, 'FH@' + CONVERT(VARCHAR(8), tblcase.Case_AutoId) 
                      + '@337' AS BARCODE, CASE WHEN TBLCASE.IndexOrAAA_Number <> '' THEN RIGHT(tblcase.IndexOrAAA_Number, 2) END AS REV_INDEX, 
                      CASE WHEN LEN(TBLCASE.IndexOrAAA_Number) > 1 THEN LEFT(tblcase.IndexOrAAA_Number, len(tblcase.IndexOrAAA_Number) - 3) 
                      END AS REV_INDEX_1, Table2.NOTE1, Table2.NOTE2
FROM         tblcase INNER JOIN
                      tblInsuranceCompany ON tblcase.InsuranceCompany_Id = tblInsuranceCompany.InsuranceCompany_Id INNER JOIN
                      tblProvider ON tblcase.Provider_Id = tblProvider.Provider_Id INNER JOIN
                      tblCourt ON tblcase.Court_Id = tblCourt.Court_Id INNER JOIN
                      tblSettlements ON tblcase.Case_Id = tblSettlements.Case_Id INNER JOIN
                      Table2 ON tblcase.Case_Id = Table2.Case_id OR tblcase.Case_Code = Table2.Case_id LEFT OUTER JOIN
                      tblTreatment ON tblSettlements.Treatment_Id = tblTreatment.Treatment_Id
WHERE      (isnull(tblSettlements.Settlement_Batch,'') = @batch) --AND (tblSettlements.Settlement_subBatch=@subbatch)
ORDER BY tblProvider.Provider_Name, REV_INDEX
)
GO
