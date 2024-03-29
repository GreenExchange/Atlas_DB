USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[GreenBillServiceType_Retrive]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GreenBillServiceType_Retrive] 
(
	@s_a_GB_ServiceType Varchar(200),
	@s_a_DomainId  Varchar(200)
)
AS
BEGIN
	SET NOCOUNT ON;

    IF(@s_a_GB_ServiceType = 'All')
    BEGIN
		 
		SELECT DISTINCT     GB_ServiceType,
							ServiceType,
							DomainId

							
						
	     FROM GreenBillServiceType
		 WHERE DomainId = @s_a_DomainId
		 
	END
	ELSE IF(@s_a_GB_ServiceType = 'UnAssign')
    BEGIN
		 
			 
		 
		SELECT DISTINCT     GB_ServiceType,
							ServiceType,
							DomainId
						
	     FROM GreenBillServiceType
		 WHERE ServiceType is null and  DomainId =  @s_a_DomainId
		 
		 
	END
	
    
END




GO
