USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[STP_DSP_GET_CASEDOCUMENTNODELIST_LEAFED_NODES]    Script Date: 6/17/2019 2:54:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[STP_DSP_GET_CASEDOCUMENTNODELIST_LEAFED_NODES]
	@CASEID NVARCHAR(255)='',
	@ISARCHIVED NCHAR='0',
	@OPERATION NVARCHAR(20)='LEAFED-NODES',
	@UserId NVARCHAR(50)
AS
BEGIN

CREATE TABLE #TEMP(NodeID NVARCHAR(100),ParentID INT,Nodename_code NVARCHAR(MAX),NodeIcon NVARCHAR(200),NodeLevel INT,Expanded INT,orderby NVARCHAR(MAX))

	IF @OPERATION = 'LEAFED-NODES'
	BEGIN
	INSERT INTO #TEMP
		SELECT 
				cast(T.NodeID AS NVARCHAR) NodeID, 
				T.ParentID,
				'<input class=''c'' type=''checkbox'' id=''' + convert(nvarchar(50),T.NodeID) + ''' onclick=''ob_t2c(this)''>' + T.NodeName, 
				T.NodeIcon, 
				T.NodeLevel, 
				T.Expanded,
				T.NodeName AS orderby
			FROM 
				tblTags T 
			WHERE 
				CaseID= @CASEID AND 
				parentid IS NULL 
		UNION
		SELECT 
				cast(NodeID AS NVARCHAR) NodeID, 
				TTAGS.ParentID, 
				'<input class=''c'' type=''checkbox'' id=''' + CONVERT(NVARCHAR(50),NodeID) + ''' onclick=''ob_t2c(this)''>' + TTAGS.NodeName, 
				TTAGS.NodeIcon, 
				TTAGS.NodeLevel, 
				TTAGS.Expanded,
				TTAGS.NodeName AS orderby
			FROM 
				TBLTAGS TTAGS 
			WHERE 
				NODEID IN (SELECT DISTINCT(CAST(T.parentid AS NVARCHAR)) NodeID FROM tblTags T JOIN tblimagetag tit ON t.nodeid = tit.tagid	WHERE CaseID = @CASEID AND parentid IS NOT NULL) AND TTAGS.PARENTID IS NOT NULL
			
		UNION 
		SELECT DISTINCT
				(CAST(T.NodeID as nvarchar)) NodeID, 
				T.ParentID, 
				'<input class=''c'' type=''checkbox'' id=''' + convert(nvarchar(50),T.NodeID) + ''' onclick=''ob_t2c(this)''>' + T.NodeName, 
				T.NodeIcon, 
				T.NodeLevel, 
				T.Expanded,
				T.NodeName AS orderby
		FROM 
				tblTags T JOIN 
				tblimagetag tit ON t.nodeid = tit.tagid
		WHERE 
				CaseID = @CASEID AND parentid IS NOT NULL 
		UNION
		SELECT 
				'IMG-' + Cast(I.ImageID as nvarchar), 
				T.NodeID, 
				--'<input class=''c'' type=''checkbox'' id=''IMG-' + convert(nvarchar(50),I.ImageID) + ''' onclick=''ob_t2c(this)''> <a href='''+s.ParameterValue+I.FilePath+I.FileName +''' target=''imageframe'' onclick=''VisibleFrame();'' >'+I.FileName+'</a>', 'page.gif', 
				'<input class=''c'' type=''checkbox'' id=''IMG-' + convert(nvarchar(50),I.ImageID) + ''' onclick=''ob_t2c(this)''> <a href='''+
				
				REPLACE( s.ParameterValue+I.FilePath+I.FileName ,char(39),'&#39;') +''' target=''imageframe'' onclick=''VisibleFrame();'' >'
				 + I.FileName+'</a>', 'page.gif', 
				T.NodeLevel+1, 
				1,
				T.NodeName AS orderby
		FROM 
				tbldocimages I JOIN 
				tblImageTag IT ON IT.ImageID=i.ImageID JOIN 
				tblTags T ON T.NodeID = IT.TagID AND T.CaseID = @CASEID LEFT JOIN 
				tblApplicationSettings s ON s.parametername='DocumentUploadLocation'		
	END	
	ELSE
	BEGIN
		IF @ISARCHIVED='0'
		INSERT INTO #TEMP
			SELECT 
					CAST(T.NodeID as nvarchar) NodeID, 
					T.ParentID, 
					'<input class=''c'' type=''checkbox'' id=''' + convert(nvarchar(50),T.NodeID) + ''' onclick=''ob_t2c(this)''>' + T.NodeName, 
					T.NodeIcon, 
					T.NodeLevel, 
					T.Expanded,
					T.NodeName AS orderby
			FROM 
					tblTags T 
			WHERE 
					CaseID=@CASEID 
			
			UNION  
			SELECT 
					'IMG-' + Cast(I.ImageID as nvarchar), 
					T.NodeID, 
					--'<input class=''c'' type=''checkbox'' id=''IMG-' + convert(nvarchar(50),I.ImageID) + ''' onclick=''ob_t2c(this)''> <a href='''+s.ParameterValue+I.FilePath+I.FileName +''' target=''imageframe'' onclick=''VisibleFrame();''>'+I.FileName+'</a>', 'page.gif', 
					'<input class=''c'' type=''checkbox'' id=''IMG-' + convert(nvarchar(50),I.ImageID) + ''' onclick=''ob_t2c(this)''> <a href='''+
				
				REPLACE( s.ParameterValue+I.FilePath+I.FileName ,char(39),'&#39;') +''' target=''imageframe'' onclick=''VisibleFrame();'' >'
				 
				+ I.FileName+'</a>', 'page.gif', 
					T.NodeLevel+1, 
					1,
					T.NodeName AS orderby
			FROM 
					tbldocimages I  INNER JOIN 
					tblImageTag IT ON IT.ImageID=i.ImageID  INNER JOIN 
					tblTags T ON T.NodeID=IT.TagID AND T.CaseID=@CASEID LEFT JOIN 
					tblApplicationSettings s ON s.parametername='DocumentUploadLocation'
					
			
		ELSE
		INSERT iNTO #TEMP
			SELECT 
				CAST(T.NodeID AS NVARCHAR) NodeID, 
				T.ParentID,
				'<input class=''c'' type=''checkbox'' id=''' + convert(nvarchar(50),T.NodeID) + ''' onclick=''ob_t2c(this)''>' + T.NodeName, 
				T.NodeIcon, 
				T.NodeLevel, 
				T.Expanded,
				T.NodeName AS orderby
			FROM 
				tblTags T 
			WHERE 
				CaseID	=	@CASEID 
				
			UNION  
			SELECT 
				'IMG-' + Cast(I.ImageID as nvarchar), 
				T.NodeID, 
				--'<input class=''c'' type=''checkbox'' id=''IMG-' + convert(nvarchar(50),I.ImageID) + ''' onclick=''ob_t2c(this)''><a href='''+s.ParameterValue+I.FilePath+I.FileName +''' target=''imageframe'' onclick=''VisibleFrame();''>'+I.FileName+'</a>', 'page.gif', 
				'<input class=''c'' type=''checkbox'' id=''IMG-' + convert(nvarchar(50),I.ImageID) + ''' onclick=''ob_t2c(this)''> <a href='''+
				
				REPLACE( s.ParameterValue+I.FilePath+I.FileName ,char(39),'&#39;') +''' target=''imageframe'' onclick=''VisibleFrame();'' >'
				+I.FileName+'</a>', 'page.gif', 
				T.NodeLevel+1, 
				1,
				T.NodeName AS orderby
			FROM 
				tbldocimages I  INNER JOIN 
				tblImageTag IT ON IT.ImageID=i.ImageID  INNER JOIN 
				tblTags T ON T.NodeID=IT.TagID AND T.CaseID=@CASEID LEFT JOIN 
				tblApplicationSettings s ON s.parametername='ArchivedDocumentUploadLocation' 				
	END
	
	if @UserId=0   
	SELECT * FROM #TEMP   ORDER BY   nodelevel,orderby 
	else
	SELECT * FROM #TEMP WHERE orderby in(select nodename from MST_DOCUMENT_NODES where NodeID in(select nodeid from dbo.tbl_node_role where roleid in(select Roleid from dbo.IssueTracker_Users where UserId =@UserID)))  
	ORDER BY   nodelevel,orderby 
	

		SELECT 
			filename,
			I.ImageID,
			filepath,
			nodename,
			loginid,
			REPLACE( s.ParameterValue+I.FilePath+I.FileName ,char(39),'&#39;')  as filepath , 
			username
		FROM 
			tbldocimages I
			JOIN tblImageTag IT ON IT.ImageID=i.ImageID
			JOIN tblTags T ON T.NodeID = IT.TagID and T.CaseID= @CASEID
			LEFT JOIN tblApplicationSettings s ON s.parametername='DocumentUploadLocation'
			LEFT JOIN dbo.IssueTracker_Users  ON UserId   = CASE WHEN  ISNUMERIC(loginid)= 1 THEN  loginid ELSE 1 END		
		ORDER BY 
			nodelevel

END
GO
