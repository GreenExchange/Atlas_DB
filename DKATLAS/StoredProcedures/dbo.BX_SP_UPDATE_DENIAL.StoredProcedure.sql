USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[BX_SP_UPDATE_DENIAL]    Script Date: 6/17/2019 2:53:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		srosenthal
-- ALTER date: 2/8/2009
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[BX_SP_UPDATE_DENIAL] 
	-- Add the parameters for the stored procedure here
	@ID int ,@DENIAL_REASON int ,@DENIAL_DATE VARCHAR(20),@CLEAR_DATA INT,@STATUS INT
AS

BEGIN
	
	SET NOCOUNT ON;
	
	
	IF @CLEAR_DATA = -1
		BEGIN 
			SET @DENIAL_REASON= NULL
			SET @DENIAL_DATE = NULL
		END

	
   		UPDATE BX_SERVICES
		SET DENIAL_DATE=@DENIAL_DATE,DENIAL_REASON=@DENIAL_REASON,STATUS=@STATUS
		FROM BX_SERVICES WHERE ID=@ID
		

		EXEC BX_SP_BILL_QUEUE_LIT @ID=@ID




END
GO
