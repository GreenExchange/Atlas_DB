USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[BX_SP_PROVIDER_FACILITIES]    Script Date: 6/17/2019 2:53:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		srosenthal
-- ALTER date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[BX_SP_PROVIDER_FACILITIES] 
	
	@PROVIDER_ID int
AS
BEGIN
	
	SET NOCOUNT ON;

    
SELECT     tblProvider.Provider_Id, BX_FACILITY.BUSINESS_NAME, BX_FACILITY.PHONE, BX_FACILITY.ADDRESS, BX_FACILITY.CITY, BX_FACILITY.STATE, 
                      BX_FACILITY.ZIP, BX_FACILITY.ACTIVE
FROM         BX_FACILITY INNER JOIN
                      tblProvider ON BX_FACILITY.PROVIDER = tblProvider.Provider_Id
WHERE     (tblProvider.BX_SERV = 1) AND (tblProvider.PROVIDER_ID=@PROVIDER_ID)
END
GO
