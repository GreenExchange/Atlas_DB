USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[FHA_WorkArea_ResetOldValues]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[FHA_WorkArea_ResetOldValues]
	-- Add the parameters for the stored procedure here
	@Case_Id nvarchar(200)

AS
BEGIN

	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update tblTreatment set AttorneyFee = 0, SettlementInt = 0, FilingFeeAmt = 0, Settlement_Pctg = 100 where Case_Id = @Case_Id
	UPDATE TXN_ASSIGN_SETTLED_CASES SET isChanged = 0, DATE_CHANGED = getdate() WHERE CASE_ID=@Case_Id

END

GO
