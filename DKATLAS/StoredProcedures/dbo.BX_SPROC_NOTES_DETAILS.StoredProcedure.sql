USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[BX_SPROC_NOTES_DETAILS]    Script Date: 6/17/2019 2:53:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Name
-- ALTER date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[BX_SPROC_NOTES_DETAILS] 
	@CASE_ID INT
AS
BEGIN
	
	SET NOCOUNT ON;

    SELECT      ID, Case_ID, NOTES_DESC, NOTES_Type, NOTES_Date, USER_ID, NOTES_PRIORITY
FROM          BX_NOTES
WHERE CASE_ID = @CASE_ID
ORDER BY ID DESC
END
GO
