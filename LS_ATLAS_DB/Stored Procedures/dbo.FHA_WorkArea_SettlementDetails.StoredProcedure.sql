USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[FHA_WorkArea_SettlementDetails]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[FHA_WorkArea_SettlementDetails]
	
	(
		@Case_Id NVARCHAR(100)
		
	)

AS

BEGIN

	SELECT    a.*,b.settlement_notes
	FROM        LCJ_VW_CaseSearchDetails a left join tblsettlements b on a.case_id=b.case_id
	WHERE    a.Case_Id = @Case_Id

END

GO
