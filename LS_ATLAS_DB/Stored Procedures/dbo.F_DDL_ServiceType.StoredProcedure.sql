USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[F_DDL_ServiceType]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[F_DDL_ServiceType] --- [F_DDL_ServiceType] 'localhost'
@DomainId VARCHAR(50)
AS
BEGIN

	SET NOCOUNT ON;
	
	SELECT '0' as ServiceType_ID,' ---Select Service Type--- ' as ServiceType,'' as ServiceType_Value
	UNION
	SELECT ServiceType_ID, ServiceType as ServiceType , ServiceType as ServiceType_Value 
	FROM tblServiceType WHERE ServiceType not like '%select%' and ServiceType_ID <> 0 and ServiceType <> ''
	AND DomainId = @DomainId
	ORDER BY ServiceType
	
	SET NOCOUNT OFF ; 


END

GO
