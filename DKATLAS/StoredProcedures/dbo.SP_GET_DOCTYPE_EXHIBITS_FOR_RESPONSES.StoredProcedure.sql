USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[SP_GET_DOCTYPE_EXHIBITS_FOR_RESPONSES]    Script Date: 6/17/2019 2:54:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GET_DOCTYPE_EXHIBITS_FOR_RESPONSES] --[SP_GET_DOCTYPE_EXHIBITS_FOR_RESPONSES] 'FH09-55947','C:'

@SZ_CASE_ID NVARCHAR(100),
@SZ_BASE_PATH NVARCHAR(100),
@SZ_DOCUMENT_TYPE NVARCHAR(300)=NULL

AS
BEGIN

DECLARE @COunt int
DECLARE @STRQUERY VARCHAR(8000)

SET @STRQUERY = 'select I_SEQUENCE,I_DOCUMENT_TYPE, '''+@SZ_CASE_ID+ '''as  case_Id,'''' from TXN_EXHIBIT_SEQUENCE_FOR_RESPONSES where I_SEQUENCE in (1,4)
union SELECT  
	I_SEQUENCE, DOCUMENTID [EXHIBIT_ID],
	CASE_ID,
	replace(isnull('''+@SZ_BASE_PATH +'''+ ''\'' + IMAGEPATH + ''\'' + [FILENAME],N''''),''/'',''\'') [InputFilePath]
	FROM TBLIMAGES INNER JOIN
	TXN_EXHIBIT_SEQUENCE_FOR_RESPONSES ON I_DOCUMENT_TYPE=DOCUMENTID 
	INNER JOIN TBLDOCUMENTTYPE ON DOCUMENT_ID=DOCUMENTID
	WHERE CASE_ID IN (''' + @SZ_CASE_ID + ''') and DeleteFlag=0 and (FILENAME like ''%.tif%'' OR FILENAME like '''')
	ORDER BY I_SEQUENCE'
	
PRINT(@STRQUERY)

CREATE TABLE #temp
(I_SEQUENCE INT, EXHIBIT_ID int,CASE_ID VARCHAR(50),INPUTFILEPATH NVARCHAR(2000))
	
INSERT INTO #temp 	
EXEC(@STRQUERY)

CREATE TABLE #EXHIBIT
(SR INT, I_SEQUENCE INT, EXHIBIT_ID int,CASE_ID VARCHAR(50),INPUTFILEPATH NVARCHAR(2000))



INSERT INTO #EXHIBIT 
select DENSE_RANK()OVER (ORDER BY I_SEQUENCE) as EXH,I_SEQUENCE,EXHIBIT_ID,CASE_ID,INPUTFILEPATH from #temp

	SELECT I_SEQUENCE,EXHIBIT_ID, CASE_ID, INPUTFILEPATH, EXHIBIT_NAME AS DOCUMENT_TYPE FROM #EXHIBIT INNER JOIN TXN_EXHIBIT ON SR = EXHIBIT_SEQ

END
GO
