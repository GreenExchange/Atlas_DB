USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[bx_sp_contact_delete_tags]    Script Date: 6/17/2019 2:53:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		SROSENTHAL
-- ALTER date: 9/3/2008
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[bx_sp_contact_delete_tags] 
		@case_id int , 
	@contact_id int 
AS
DECLARE @notes varchar(200)
BEGIN
	
	SET NOCOUNT ON;

   
	delete from bx_contact_tags
	where case_id =@case_id and contact_id=@contact_id
	set @notes= 'CONTACT TAGS DELETED FROM THIS CASE :CONTACT ID ' + CONVERT(VARCHAR(10),@CONTACT_ID) 
	exec bx_sp_add_notes @case_id=@case_id,@desc=@NOTES ,@type='DELETE',@PRIORITY=0

END
GO
