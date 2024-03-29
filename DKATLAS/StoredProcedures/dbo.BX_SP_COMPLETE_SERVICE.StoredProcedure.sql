USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[BX_SP_COMPLETE_SERVICE]    Script Date: 6/17/2019 2:53:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		srosenthal
-- ALTER date: 1/25/2009
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[BX_SP_COMPLETE_SERVICE] 
	-- Add the parameters for the stored procedure here
	@SERVICE_ID int  
AS
BEGIN
DECLARE @CASE_ID INT, @NOTES VARCHAR(50)


	
	SET NOCOUNT ON;

SELECT @CASE_ID=CASE_ID FROM BX_SERVICES WHERE ID=@SERVICE_ID

SET @NOTES='SERVICE PAID IN FULL AND CLOSED. ID:'+ CONVERT(VARCHAR(20),@SERVICE_ID)
EXEC BX_SP_ADD_NOTES @CASE_ID=@CASE_ID,@DESC=@NOTES,@TYPE= 'Activity',@PRIORITY=0


    UPDATE BX_SERVICES
		SET COMPLETE =1,STATUS=7,DATE_CLOSED=GETDATE(),CLOSED_BY=USER_NAME()
		WHERE ID =@SERVICE_ID


END
GO
