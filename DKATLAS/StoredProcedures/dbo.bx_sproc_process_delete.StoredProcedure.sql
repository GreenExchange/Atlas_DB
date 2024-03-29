USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[bx_sproc_process_delete]    Script Date: 6/17/2019 2:53:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		srosenthal
-- ALTER date: 9/11/2008
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[bx_sproc_process_delete]
	
	
	@process_id int
AS
DECLARE @case_id int ,@NOTES VARCHAR(100),@PROCESS_DESC VARCHAR(50)
BEGIN
	
	SET NOCOUNT ON;


SELECT     @PROCESS_DESC=BX_PROCESS_TYPE.PROCESS_NAME, @CASE_ID=BX_SERVICES.CASE_ID
FROM         BX_PROCESS INNER JOIN
                      BX_PROCESS_TYPE ON BX_PROCESS.PROCESS_TYPE = BX_PROCESS_TYPE.PROCESS_TYPE_ID INNER JOIN
                      BX_SERVICES ON BX_PROCESS.SERVICE_ID = BX_SERVICES.ID
WHERE     (BX_PROCESS.PROCESS_ID = @PROCESS_ID)

    	DELETE FROM BX_PROCESS WHERE PROCESS_ID = @PROCESS_ID



SET @NOTES = 'PROCESS DELETED : '+ @PROCESS_DESC
EXEC BX_SP_ADD_NOTES @CASE_ID = @CASE_ID,@DESC=@NOTES,@TYPE='DELETE',@PRIORITY=0
END
GO
