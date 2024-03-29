USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[bx_sp_case_tagged_view]    Script Date: 6/17/2019 2:53:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		SROSENTHAL
-- ALTER date: 9/3/2008
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[bx_sp_case_tagged_view] 
		@CONTACT_id int  
	
AS
BEGIN
	
	SET NOCOUNT ON;

   SELECT     [BX_CASE].CASE_ID_LONG, [BX_CASE].PATIENT_FIRSTNAME + ' ' + [BX_CASE].PATIENT_LASTNAME AS PATIENT, 
                      BX_CONTACT_TAGS.CONTACT_ID, BX_CONTACT_TAGS.CASE_ID
FROM         BX_CONTACT_TAGS INNER JOIN
                      [BX_CASE] ON BX_CONTACT_TAGS.CASE_ID = [BX_CASE].CASE_ID
WHERE     (BX_CONTACT_TAGS.CONTACT_ID = @CONTACT_ID)
	

END
GO
