USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[BX_SP_UPDATE_PHYSICIAN]    Script Date: 6/17/2019 2:53:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		srosenthal
-- ALTER date: 2/8/2009
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[BX_SP_UPDATE_PHYSICIAN] 
	-- Add the parameters for the stored procedure here
	@ID int ,@PHYSICIAN SMALLINT
AS

BEGIN
	
	SET NOCOUNT ON;
	
		UPDATE BX_SERVICES
		SET RENDERED_BY=@PHYSICIAN
		FROM BX_SERVICES WHERE ID=@ID

END
GO
