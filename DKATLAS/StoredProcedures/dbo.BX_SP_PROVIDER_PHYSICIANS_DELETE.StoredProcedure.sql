USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[BX_SP_PROVIDER_PHYSICIANS_DELETE]    Script Date: 6/17/2019 2:53:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		srosenthal
-- ALTER date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[BX_SP_PROVIDER_PHYSICIANS_DELETE] 
	
	@PHYSICIAN_ID INT
AS
BEGIN

DELETE FROM BX_PHYSICIANS WHERE ID = @PHYSICIAN_ID
	
	
END
GO
