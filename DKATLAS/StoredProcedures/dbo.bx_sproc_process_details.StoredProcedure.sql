USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[bx_sproc_process_details]    Script Date: 6/17/2019 2:53:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		srosenthal
-- ALTER date: 9/11/2008
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[bx_sproc_process_details] 
	
	@SERVICE_ID int 
AS
DECLARE @CASE_ID INT
BEGIN
	
	SET NOCOUNT ON;

   
	SELECT     BX_PROCESS.PROCESS_ID, BX_PROCESS.PROCESS_DATE, BX_PROCESS.PROCESS_NOTES, BX_PROCESS_TYPE.PROCESS_NAME, 
                      BX_SERVICES.CASE_ID,BX_SERVICES.ID
FROM         BX_PROCESS INNER JOIN
                      BX_PROCESS_TYPE ON BX_PROCESS.PROCESS_TYPE = BX_PROCESS_TYPE.PROCESS_TYPE_ID INNER JOIN
                      BX_SERVICES ON BX_PROCESS.SERVICE_ID = BX_SERVICES.ID
WHERE     (BX_SERVICES.ID = @service_id)
ORDER BY BX_PROCESS.PROCESS_DATE DESC
END
GO
