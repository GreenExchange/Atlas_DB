USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_SettlementDetails]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LCJ_SettlementDetails]
	
	(
		@Case_Id NVARCHAR(100)
		
	)

AS

BEGIN

	SELECT    distinct a.*,b.settlement_notes
	FROM      LCJ_VW_CaseSearchDetails a left join tblsettlements b on a.case_id=b.case_id
	WHERE    a.Case_Id = @Case_Id

END
GO
