USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[BX_SP_CODING_HCPCS_SEARCH]    Script Date: 6/17/2019 2:53:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		srosenthal
-- ALTER date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[BX_SP_CODING_HCPCS_SEARCH] 
	
	@CODE NVARCHAR(10) = NULL, 
	@DESC NVARCHAR(1000) = NULL,@VERSION INT ,@STATE NVARCHAR(2)
AS
BEGIN
	

DECLARE @QUERY_STRING NVARCHAR(MAX), @FILTER_STRING NVARCHAR(1000) , @ORDER_BY_STRING NVARCHAR(1000)

	SET NOCOUNT ON;

SET @FILTER_STRING= '  WHERE (VERSION = @VERSION) AND (STATE = @STATE)   
 '


SET @QUERY_STRING = ' SELECT     HCPCS_CODE, MOD1, MOD2, JURIS, CATEGORY, CEILING, FLOOR, FEE_SCHEDULE, DESCRIPTION
FROM         BX_CODING_HCPCS_CODES 

'

IF @CODE IS NOT NULL AND @CODE <> 'NULL' SET @FILTER_STRING = @FILTER_STRING + ' AND (HCPCS_CODE LIKE ''%'' + @CODE + ''%'')  '
IF @DESC IS NOT NULL AND @DESC <>'NULL' SET  @FILTER_STRING = @FILTER_STRING + ' AND (DESCRIPTION LIKE ''%'' + @DESC + ''%'') '


SET @ORDER_BY_STRING = ' ORDER BY ID '

SET @QUERY_STRING = @QUERY_STRING + @FILTER_STRING + @ORDER_BY_STRING


EXEC SP_EXECUTESQL @QUERY_STRING, N'@VERSION INT, @STATE NVARCHAR(2), @CODE NVARCHAR(10),@DESC NVARCHAR(1000)', @VERSION=@VERSION,@STATE=@STATE,@CODE=@CODE,@DESC=@DESC



   PRINT @QUERY_STRING
	
END
GO
