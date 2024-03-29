USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[BX_SP_BILL_CLOSE]    Script Date: 6/17/2019 2:53:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		srosenthal
-- ALTER date: 2/8/2009
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[BX_SP_BILL_CLOSE] 
	-- Add the parameters for the stored procedure here
	@ID int
AS
DECLARE @CASE_ID INT,@NOTES VARCHAR(200)
BEGIN
	SET NOCOUNT ON;
		SELECT @CASE_ID=CASE_ID FROM BX_SERVICES WHERE ID=@ID
	
		UPDATE BX_SERVICES
		SET COMPLETE=1,DATE_CLOSED=GETDATE(),CLOSED_BY=USER_NAME()
		FROM BX_SERVICES WHERE ID=@ID


SET @NOTES='BILL CLOSED. ID: '+ CONVERT(VARCHAR(10),@ID)
EXEC BX_SP_ADD_NOTES @CASE_ID=@CASE_ID,@DESC=@NOTES,@TYPE= 'Activity',@PRIORITY=0

END
GO
