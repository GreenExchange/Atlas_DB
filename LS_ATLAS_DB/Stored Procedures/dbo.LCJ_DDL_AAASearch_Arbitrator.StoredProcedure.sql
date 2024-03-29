USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_DDL_AAASearch_Arbitrator]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LCJ_DDL_AAASearch_Arbitrator]
@DomainId NVARCHAR(50)
AS        
begin        
SELECT     ARBITRATOR_ID, ARBITRATOR_NAME + ' [ ' + ABITRATOR_LOCATION + ' ] ' AS ARBITRATOR_NAME
FROM         TblArbitrator where DomainId=@DomainId and ARBITRATOR_NAME in(select distinct ARBITRATOR_NAME from TblArbitrator where ARBITRATOR_NAME !='')
order by arbitrator_name
end

GO
