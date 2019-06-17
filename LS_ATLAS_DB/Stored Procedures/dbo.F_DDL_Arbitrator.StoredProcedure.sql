USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[F_DDL_Arbitrator]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[F_DDL_Arbitrator]
	
AS
BEGIN

	SET NOCOUNT ON;
	
	SELECT '0' as ARBITRATOR_ID,' ---Select Arbitrator--- ' as ARBITRATOR_NAME, ' ---Select Arbitrator--- ' as ARBITRATOR_NAME_LOC
	UNION
	SELECT ARBITRATOR_ID, ARBITRATOR_NAME as ARBITRATOR_NAME, ARBITRATOR_NAME + ' [ ' + ABITRATOR_LOCATION + ' ] ' AS ARBITRATOR_NAME_LOC
	FROM TblArbitrator WHERE ARBITRATOR_NAME not like '%select%' and ARBITRATOR_ID <> 0 and ARBITRATOR_NAME <> ''
	ORDER BY ARBITRATOR_NAME
	
	SET NOCOUNT OFF ; 


END

GO
