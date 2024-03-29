USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_DDL_Arbitrator]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[LCJ_DDL_Arbitrator]
@DomainId NVARCHAR(50)
AS        
begin        
SELECT '0' AS ARBITRATOR_ID,'--Select--' AS ARBITRATOR_NAME
UNION
SELECT     ARBITRATOR_ID, CONCAT(ARBITRATOR_NAME,  ' [ ', ABITRATOR_LOCATION, ' ] ') AS ARBITRATOR_NAME
FROM         TblArbitrator
WHERE DomainId=@DomainId
order by arbitrator_name
end

--[LCJ_DDL_Arbitrator] 'amt'
GO
