USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_DDL_Arbitrator]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LCJ_DDL_Arbitrator]
AS        
begin        
SELECT '0' AS ARBITRATOR_ID,'' AS ARBITRATOR_NAME
UNION
SELECT     ARBITRATOR_ID, ARBITRATOR_NAME + ' [ ' + ABITRATOR_LOCATION + ' ] ' AS ARBITRATOR_NAME
FROM         TblArbitrator
order by arbitrator_name
end
GO
