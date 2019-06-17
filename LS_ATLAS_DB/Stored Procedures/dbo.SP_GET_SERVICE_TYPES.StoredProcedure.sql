USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[SP_GET_SERVICE_TYPES]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_GET_SERVICE_TYPES]
@DomainId NVARCHAR(50)
AS
BEGIN
	SELECT '0' AS ServiceTypeID,' --- Select Sevice Types --- ' AS ServiceType
	union 
	SELECT DISTINCT ServiceType AS ServiceTypeID, ServiceType 
	FROM tblServiceType WHERE DomainId=@DomainId

END


GO
