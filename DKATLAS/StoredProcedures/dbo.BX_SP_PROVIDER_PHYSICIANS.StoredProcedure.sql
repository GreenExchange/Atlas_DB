USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[BX_SP_PROVIDER_PHYSICIANS]    Script Date: 6/17/2019 2:53:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		srosenthal
-- ALTER date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[BX_SP_PROVIDER_PHYSICIANS] 
	
	@PROVIDER_ID int
AS
BEGIN
	
	SET NOCOUNT ON;
SELECT     tblProvider.Provider_Id, BX_PHYSICIANS.NAME, BX_PHYSICIANS.TYPE, BX_PHYSICIANS.ACTIVE, BX_PHYSICIANS.ID
FROM         tblProvider INNER JOIN
                      BX_PHYSICIANS ON tblProvider.Provider_Id = BX_PHYSICIANS.PROVIDER
    
WHERE     (tblProvider.BX_SERV = 1) AND (tblProvider.PROVIDER_ID=@PROVIDER_ID)
END
GO
