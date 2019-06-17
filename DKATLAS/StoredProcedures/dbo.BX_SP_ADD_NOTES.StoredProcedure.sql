USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[BX_SP_ADD_NOTES]    Script Date: 6/17/2019 2:53:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		srosenthal
-- ALTER date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[BX_SP_ADD_NOTES] 
	@CASE_ID INT ,@DESC VARCHAR(500),@TYPE VARCHAR(20),@PRIORITY TINYINT,@SERVICE_ID INT =NULL
	
AS
BEGIN
	
	SET NOCOUNT ON;

   INSERT INTO BX_NOTES (CASE_ID,NOTES_DESC,NOTES_DATE,NOTES_TYPE,NOTES_PRIORITY,USER_ID,SERVICE_ID)
VALUES (@CASE_ID,@DESC,GETDATE(),@TYPE,@PRIORITY,USER_NAME(),@SERVICE_ID)
END
GO
