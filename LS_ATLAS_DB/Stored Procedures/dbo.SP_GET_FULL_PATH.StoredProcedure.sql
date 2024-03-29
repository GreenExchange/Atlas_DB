USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[SP_GET_FULL_PATH]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GET_FULL_PATH]
@SZ_NODEID NVARCHAR(10)
AS
BEGIN
	DECLARE @SZPATH NVARCHAR(4000)
	DECLARE @NODELEVEL VARCHAR(10)

	DECLARE @SZPARENTID NVARCHAR(10)
	DECLARE @SZ_TEMP_PARENTID NVARCHAR(10)
	DECLARE @NODENAME NVARCHAR(1000)
	
	SET @NODELEVEL = 0
	
	SELECT @NODELEVEL = NODELEVEL , 
		   @SZPARENTID = PARENTID , 
		   @NODENAME=NODENAME 
	FROM   TBLTAGS 
	WHERE NODEID=@SZ_NODEID
	
	SET @SZPATH = @NODENAME
	
	WHILE @NODELEVEL >= 1
	BEGIN	
		 SELECT @SZ_TEMP_PARENTID=PARENTID,@NODENAME=NODENAME FROM TBLTAGS WHERE NODEID=@SZPARENTID		
		 SET @SZPARENTID=@SZ_TEMP_PARENTID
		 SET @SZPATH = @NODENAME + '\' + @SZPATH
		 SET @NODELEVEL = @NODELEVEL - 1
	END
	SELECT @SZPATH
END



/*

EXEC SP_GET_FULL_PATH '4700'

SELECT * FROM TBLTAGS

\Stip extending time to answer\Test ADD
SELECT @SZ _PARENTID=PARENTID,NODENAME FROM TBLTAGS WHERE NODEID='4700'

SELECT * FROM TBLTAGS WHERE NODEID='4700'

SELECT * FROM TBLTAGS WHERE NODEID='4057'

SELECT * FROM TBLTAGS WHERE NODEID='4055'
*/

GO
