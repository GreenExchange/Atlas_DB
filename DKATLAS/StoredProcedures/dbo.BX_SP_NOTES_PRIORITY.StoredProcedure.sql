USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[BX_SP_NOTES_PRIORITY]    Script Date: 6/17/2019 2:53:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		srosenthal
-- ALTER date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[BX_SP_NOTES_PRIORITY] 
	
	@ID  INT,@CURR_PRI BIT
AS
BEGIN
	
	SET NOCOUNT ON;
IF @CURR_PRI =1
	BEGIN
   UPDATE BX_NOTES	
	SET NOTES_PRIORITY = 0
	WHERE NOTES_PRIORITY=1 AND ID=@ID
GOTO FINISH
END



	UPDATE BX_NOTES	
	SET NOTES_PRIORITY = 1
	WHERE NOTES_PRIORITY=0 AND ID=@ID


FINISH:
END
GO
