USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[F_DDL_ServiceType]    Script Date: 6/17/2019 2:54:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[F_DDL_ServiceType]
	
AS
BEGIN

	SET NOCOUNT ON;
	
	SELECT '0' as ServiceType_ID,' ---Select Service Type--- ' as ServiceType
	UNION
	SELECT ServiceType_ID, ServiceType as ServiceType 
	FROM tblServiceType WHERE ServiceType not like '%select%' and ServiceType_ID <> 0 and ServiceType <> ''
	ORDER BY ServiceType
	
	SET NOCOUNT OFF ; 


END
GO
