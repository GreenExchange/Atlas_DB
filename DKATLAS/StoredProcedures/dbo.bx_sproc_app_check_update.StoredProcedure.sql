USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[bx_sproc_app_check_update]    Script Date: 6/17/2019 2:53:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		srosenthal
-- ALTER date: 9/20/2008
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[bx_sproc_app_check_update] 
@APP_KEY VARCHAR(50) ,@APP_VER DECIMAL(4,2)
WITH EXECUTE AS 'dbo'
AS

BEGIN

	SET NOCOUNT ON;


select top(1) version_number,LICENSEE_CODE,UPDATE_KEY*100000000000000000 AS UPDATE_KEY ,UPDATE_PATH from bx_app_control where version_number >@APP_VER and active=1 and update_from<=@APP_VER
ORDER BY VERSION_NUMBER DESC

END
GO
