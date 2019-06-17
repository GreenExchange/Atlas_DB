USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[BX_SP_PROVIDER_PHYSICIANS_ADD]    Script Date: 6/17/2019 2:53:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		srosenthal
-- ALTER date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[BX_SP_PROVIDER_PHYSICIANS_ADD] 
	
	@PROVIDER_ID int,@NAME VARCHAR(100),@SHORT_NAME VARCHAR(50),@TYPE VARCHAR(5)
AS
BEGIN

INSERT INTO BX_PHYSICIANS (NAME,TYPE,SHORT_NAME,PROVIDER,ACTIVE)
VALUES (@NAME,@TYPE,@SHORT_NAME,@PROVIDER_ID,1)
	
	
END
GO
