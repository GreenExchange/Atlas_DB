USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[SP_GET_DOCTYPE_EXHIBITS_FOR_ARBITRATION]    Script Date: 6/17/2019 2:54:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GET_DOCTYPE_EXHIBITS_FOR_ARBITRATION] --'FH09-55947','C:'

@SZ_CASE_ID NVARCHAR(100),
@SZ_BASE_PATH NVARCHAR(100),
@SZ_DOCUMENT_TYPE NVARCHAR(300)=NULL

AS
BEGIN

DECLARE @COunt int
DECLARE @STRQUERY VARCHAR(8000)

SET @STRQUERY = 'SELECT DISTINCT 
	I_SEQUENCE, 
	CASE_ID,
	DOCUMENTID [EXHIBIT_ID],
	TXN_EXHIBIT_SEQUENCE_FOR_ARBITRATION.DOCUMENT_TYPE,
	replace(isnull('''+@SZ_BASE_PATH +'''+ ''\'' + IMAGEPATH + ''\'' + [FILENAME],N''''),''/'',''\'') [InputFilePath]
	FROM TBLIMAGES INNER JOIN
	TXN_EXHIBIT_SEQUENCE_FOR_ARBITRATION ON I_DOCUMENT_TYPE=DOCUMENTID 
	INNER JOIN TBLDOCUMENTTYPE ON DOCUMENT_ID=DOCUMENTID
	WHERE CASE_ID IN (''' + @SZ_CASE_ID + ''') and DeleteFlag=0 and (FILENAME like ''%.tif%'' OR FILENAME like '''')
	ORDER BY I_SEQUENCE'

PRINT(@STRQUERY)
EXEC(@STRQUERY)

END
GO
