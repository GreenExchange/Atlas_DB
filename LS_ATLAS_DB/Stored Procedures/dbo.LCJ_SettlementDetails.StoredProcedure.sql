USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_SettlementDetails]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LCJ_SettlementDetails]
	
	(
		@DomainId NVARCHAR(50),
		@Case_Id NVARCHAR(100)
		
	)

AS

BEGIN

	SELECT    distinct a.*,b.settlement_notes
	FROM      LCJ_VW_CaseSearchDetails a left join tblSettlements  b on a.case_id=b.case_id and a.DomainId=b.DomainId
	WHERE    a.Case_Id = @Case_Id
	AND a.DomainId=@DomainId

END

GO
