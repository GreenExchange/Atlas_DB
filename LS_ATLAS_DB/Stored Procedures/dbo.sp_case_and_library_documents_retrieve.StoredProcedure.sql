USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[sp_case_and_library_documents_retrieve]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--sp_case_and_library_documents_retrieve 'GLF18-102889'

CREATE PROCEDURE [dbo].[sp_case_and_library_documents_retrieve] 
 @s_a_fk_case_id VARCHAR(MAX)
AS
BEGIN  
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

		CREATE TABLE #CASE_DOCUMENTS
		(
			NodeID			VARCHAR(MAX),
			ParentID		VARCHAR(MAX),
			NodeName		VARCHAR(MAX),
			filepath		VARCHAR(MAX),
			NodeIDFilePath	VARCHAR(MAX),
			order_by		VARCHAR(MAX)
		)
		
		CREATE TABLE #CASE_DOCUMENTS_DELETE
		(
			id		INT IDENTITY(1,1),
			NodeID	BIGINT
		)
		
		--Case Document Manager
		INSERT INTO #CASE_DOCUMENTS
		SELECT DISTINCT
			CAST(T.NodeID AS VARCHAR(MAX)) AS NodeID,    
			CAST(T.ParentID AS VARCHAR(MAX)) AS ParentID,    
			CASE WHEN T.NodeName = @s_a_fk_case_id THEN 'Document Manager' ELSE T.NodeName END AS NodeName,
			filepath='',
			NodeIDFilePath='~',
			T.NodeName AS order_by
		FROM     
			tblTags T (NOLOCK)
		WHERE 
			CaseID=@s_a_fk_case_id AND
			ParentID IS NULL
		UNION ALL 
		SELECT   
			CAST(T.NodeID AS VARCHAR(MAX)) AS NodeID,
			CAST(T.ParentID AS VARCHAR(MAX)) AS ParentID,    
			T.NodeName AS NodeName,
			filepath='',
			NodeIDFilePath='~',
			T.NodeName AS order_by
		FROM   
			tblTags T (NOLOCK)
		WHERE   
			NodeID IN (SELECT DISTINCT(CAST(T.parentid AS NVARCHAR)) NodeID FROM tblTags T JOIN tblimagetag tit ON t.nodeid = tit.tagid WHERE CaseID = @s_a_fk_case_id AND parentid IS NOT NULL) AND T.ParentID IS NOT NULL  
		UNION ALL
		SELECT DISTINCT  
			CAST(T.NodeID AS VARCHAR(MAX)) AS NodeID,
			CAST(T.ParentID AS VARCHAR(MAX)) AS ParentID,    
			T.NodeName AS NodeName,
			filepath='',
			NodeIDFilePath='~',
			T.NodeName AS order_by  
		FROM   
			tblTags T (NOLOCK)
			JOIN tblimagetag tit ON t.nodeid = tit.tagid  
		WHERE
			CaseID = @s_a_fk_case_id AND 
			parentid IS NOT NULL    
		UNION ALL
		SELECT
			'IMG-'+CAST(I.ImageID AS VARCHAR(MAX)) AS NodeID,     
			CAST(T.NodeID AS VARCHAR(MAX)) AS ParentID,       
			I.FileName AS NodeName,
			REPLACE(REPLACE('/'+I.FilePath+I.FileName , '\','/'),char(39),'''') AS filepath,
			NodeIDFilePath=CAST(I.ImageID AS VARCHAR(MAX))+'~'+CAST(I.BasePathId AS VARCHAR(MAX))+'~'+REPLACE(REPLACE('/'+I.FilePath+I.FileName , '\','/'),char(39),''''),
			T.NodeName AS order_by
		FROM     
			TBLDOCIMAGES I (NOLOCK) INNER JOIN     
			tblImageTag IT (NOLOCK) ON IT.ImageID=i.ImageID INNER JOIN     
			tblTags T (NOLOCK) ON T.NodeID=IT.TagID AND T.CaseID=@s_a_fk_case_id --LEFT JOIN     
			--tblApplicationSettings s (NOLOCK) ON s.parametername='BasePathId' --LEFT JOIN
			--tblBasePath BP (NOLOCK) ON BP.BasePathId = s.ParameterValue
		WHERE
			LOWER(I.FileName) like '%.pdf%'
		ORDER BY     
			ParentID,
			order_by
	
		;WITH tblChild AS
		(
			SELECT * FROM #CASE_DOCUMENTS WHERE ParentID NOT IN (SELECT DISTINCT NodeID FROM #CASE_DOCUMENTS)
			UNION ALL
			SELECT B.* FROM #CASE_DOCUMENTS B JOIN tblChild  ON B.ParentId = tblChild.NodeID
		)
		
		INSERT INTO #CASE_DOCUMENTS_DELETE
		SELECT NodeID FROM tblChild OPTION(MAXRECURSION 32767)
		
		DELETE FROM #CASE_DOCUMENTS WHERE NodeID IN (SELECT NodeID FROM #CASE_DOCUMENTS_DELETE)
			
		SELECT DISTINCT
			NodeID,	
			ParentID,
			NodeName,
			filepath,
			NodeIDFilePath,
			order_by
		FROM
			#CASE_DOCUMENTS
		ORDER BY
			ParentID,
			order_by;
			
		DROP TABLE #CASE_DOCUMENTS
		DROP TABLE #CASE_DOCUMENTS_DELETE
END  
GO
