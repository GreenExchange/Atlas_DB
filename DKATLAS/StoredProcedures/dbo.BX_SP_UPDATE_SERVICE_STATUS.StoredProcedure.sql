USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[BX_SP_UPDATE_SERVICE_STATUS]    Script Date: 6/17/2019 2:53:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		srosenthal
-- ALTER date: 1/25/2009
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[BX_SP_UPDATE_SERVICE_STATUS] 
@SERVICE_ID INT , @NEW_STATUS SMALLINT
	
AS

BEGIN
	
	SET NOCOUNT ON;
UPDATE BX_SERVICES
SET STATUS =@NEW_STATUS
WHERE ID=@SERVICE_ID


END
GO
