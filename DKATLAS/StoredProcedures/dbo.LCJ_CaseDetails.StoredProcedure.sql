USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_CaseDetails]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[LCJ_CaseDetails]
	
	(
		@Case_Id NVARCHAR(100)
		
	)

AS

BEGIN

	SELECT    *
	FROM        LCJ_VW_CaseDetails
	WHERE    Case_Id = @Case_Id

END
GO
