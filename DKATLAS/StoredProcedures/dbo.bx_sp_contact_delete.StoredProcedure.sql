USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[bx_sp_contact_delete]    Script Date: 6/17/2019 2:53:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		srosenthal
-- ALTER date: 9/4/2008
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[bx_sp_contact_delete] 
	
	@contact_id int 
	 
AS
BEGIN
	
	SET NOCOUNT ON;

   	 update bx_contacts
	 set active = 0
	from bx_contacts where contact_id=@contact_id 
END
GO
