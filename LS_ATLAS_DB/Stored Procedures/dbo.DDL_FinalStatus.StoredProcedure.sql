USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[DDL_FinalStatus]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DDL_FinalStatus] -- [F_DDL_ProviderGroup] 'GLF'
(
	@DomainID VARCHAR(50)
)
AS
BEGIN

	SET NOCOUNT ON;
	
	SELECT '0' as FinalStatus_ID,' ---Select Final Status--- ' as FinalStatus_Name, '' AS FinalStatus_Name_Value
	UNION
	SELECT FinalStatus_ID AS FinalStatus_ID , FinalStatus_Name as FinalStatus_Name, FinalStatus_Name AS FinalStatus_Name_Value
	FROM tbl_FinalStatus WHERE --DESCRIPTION not like '%select%'  and
	 DomainId = @DomainID
	ORDER BY FinalStatus_Name
	
	SET NOCOUNT OFF ; 

END

GO
