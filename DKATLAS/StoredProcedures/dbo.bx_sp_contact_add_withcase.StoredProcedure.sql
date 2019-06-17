USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[bx_sp_contact_add_withcase]    Script Date: 6/17/2019 2:53:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		srosenthal
-- ALTER date: 9/5/2008
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[bx_sp_contact_add_withcase] 
	
	@case_id INT,@CONTACT_ID INT
AS
BEGIN
	
	SET NOCOUNT ON;

UPDATE [BX_CASE]
SET ASSOC_CONTACT_ID = @CONTACT_ID
WHERE CASE_ID = @CASE_ID

EXEC BX_SP_CONTACT_ADD_TAGS @CASE_ID=@CASE_ID,@CONTACT_ID =@CONTACT_ID


	
    
	 
END
GO
