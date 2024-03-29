USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[bx_sp_contact_add_tags]    Script Date: 6/17/2019 2:53:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		SROSENTHAL
-- ALTER date: 9/3/2008
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[bx_sp_contact_add_tags] 
		@case_id int , 
	@contact_id int 
AS
DECLARE @notes varchar(200)
BEGIN
	
	SET NOCOUNT ON;

   
	insert into bx_contact_tags (case_id,contact_id)
	values (@case_id,@contact_id)
	set @notes= 'CONTACT ID ' + CONVERT(VARCHAR(10),@CONTACT_ID) +' TAGGED TO THIS CASE'
	exec BX_sp_add_notes @case_id=@case_id,@desc=@NOTES ,@type='ACTIVITY',@PRIORITY=0

END
GO
