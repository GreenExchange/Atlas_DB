USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[F_SettlementDetails]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[F_SettlementDetails]
	
	(
		@s_a_case_id NVARCHAR(100)
		
	)

AS

BEGIN
	
	
		SELECT  DISTINCT a.*,b.settlement_notes,b.Settlement_Af,b.Settlement_Int,Settlement_Ff
	FROM      tblcase a left join tblsettlements b on a.case_id=b.case_id
	WHERE    a.Case_Id = @s_a_case_id
	
		
	

END

GO
