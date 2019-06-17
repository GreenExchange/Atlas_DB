USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[FHA_WorkArea_ResetExistingSettlement]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[FHA_WorkArea_ResetExistingSettlement]
(
@settlementId NVARCHAR(200)
)
AS
BEGIN
	DELETE FROM tblSettlements where Settlement_Id = @settlementId
	DELETE FROM tbl_treatment_settled WHERE Settlementid = @settlementId
END

GO
