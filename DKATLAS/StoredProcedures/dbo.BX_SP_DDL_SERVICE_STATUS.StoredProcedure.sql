USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[BX_SP_DDL_SERVICE_STATUS]    Script Date: 6/17/2019 2:53:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		srosenthal
-- ALTER date: 1/25/2009
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[BX_SP_DDL_SERVICE_STATUS] 

	
AS
BEGIN
	
	SET NOCOUNT ON;


SELECT     NAME, ID
FROM         BX_SERVICE_STATUS
ORDER BY NAME


END
GO
