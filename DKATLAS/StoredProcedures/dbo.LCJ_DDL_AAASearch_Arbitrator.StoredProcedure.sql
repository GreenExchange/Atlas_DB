USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_DDL_AAASearch_Arbitrator]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LCJ_DDL_AAASearch_Arbitrator]
AS        
begin        
SELECT     ARBITRATOR_ID, ARBITRATOR_NAME + ' [ ' + ABITRATOR_LOCATION + ' ] ' AS ARBITRATOR_NAME
FROM         TblArbitrator where ARBITRATOR_NAME in(select distinct ARBITRATOR_NAME from TblArbitrator where ARBITRATOR_NAME !='')
order by arbitrator_name
end
GO
